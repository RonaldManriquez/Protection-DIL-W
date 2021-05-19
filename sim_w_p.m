function [T,P]=sim_w_p(delta,aa,s,tau,g)
load graphs_protection.mat

if g==2
   G=G_sandy;
elseif g==3
   G=G_birds;
elseif g==4
   G=G_mat72;
elseif g==5
    G=G_zachary;
end
A=adjacency(G,'weighted');
N=length(A);
sick=zeros(1000,s);
MAX=zeros(s,1);
for r=1:s
old_state = zeros(N,1); %inicial infected Vector
W = randperm(N,aa);

for a = 1:aa
    old_state(W(1,a),1) = 1;
end
vector=old_state;
luk = sir(old_state,N);
history = luk;
new_state=zeros(N,1);

while (luk(2)>0)
    Prob_Inf = A*vector*tau(g);
    for i=1:N
        if old_state(i)==-1
            new_state(i)=-1;
        elseif old_state(i)==1
                sal=rand;
            if sal>delta
                new_state(i)=1;
            else
                new_state(i)=-1;
            end
        else
            if old_state(i)==0
                nat = rand;
                if (Prob_Inf(i) > nat)
                    new_state(i)=1;
                else
                    new_state(i)=0;
                end
            end
        end
   end
vector=transforma(new_state,N);
old_state=new_state;
luk = sir(old_state,N);
history(length(history(:,1))+1,:) = luk;
end
sick(1:length(history(:,2)),r)=history(:,2)/N;
MAX(r)=length(history(:,2));
end
P=zeros(max(MAX),1);
for j=1:max(MAX)
    k=find(sick(j,:));
    %x=sick(j,:);
    %B(j)=median(x(k));
    P(j)=sum(sick(j,:))/length(k);
end
T=1:1:max(MAX);
end