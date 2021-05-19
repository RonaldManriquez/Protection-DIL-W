function [T,P,SR]=simulation_average_deleted(tau,delta,aa,s,p,rank,alpha,g)
%input=
%output=
%Ranking de vertices
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
if rank==1
   L=vertex_importance_wei_prop(G,alpha);%Vertex Importance rank   1
elseif rank==2
   L=strength(A); %strength rank   2
 elseif rank==3
   L=centrality(G,'closeness','Cost',G.Edges.Weight.^(-1));%
elseif rank==4
    L=betweenness_wei(A);% betweenness rank;  4
elseif rank==5
    L=lap_w(G);%Laplacian rank; 5
end

[~,S_1]=sort(L,'descend');%%
%A=adjacency(G);
N=length(A);
rpro=round(N*p);
sick=zeros(1000,s);
MAX=zeros(s,1);
MAX2=zeros(s,1);
fI2=zeros(1000,s);
for r=1:s
old_state = zeros(N,1); %inicial infected Vector
W = randperm(N,aa);
for i=1:rpro%%%387=10%A
if W==S_1(i)
   W = 0;
   W = randperm(N,aa);
   i=0;
end
end
for a = 1:aa
    old_state(W(1,a),1) = 1;
end
for j=1:rpro
    NN=neighbors(G,S_1(j));
    for m=1:length(NN)
        G=rmedge(G,S_1(j),NN(m));
    end
end
vector=old_state;
luk = sir(old_state,N);
history = luk;
new_state=zeros(N,1);
A=adjacency(G,'weighted');
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
MAX2(r)=history(end,1);%length(history(:,1));
%fI2(1:length(history(:,1)),r)=history(:,1)/N;
%T2=1:1:length(history(:,3));
%plot(T2,history(:,2)/N,'gs')
%hold on
end
%B=zeros(max(MAX),1);
P=zeros(max(MAX),1);
%fI=zeros(max(MAX2),1);
SR0=sum(MAX2)/s;
SR=SR0/N;
for j=1:max(MAX)
    k=find(sick(j,:));
    %x=sick(j,:);
    %B(j)=median(x(k));
    P(j)=sum(sick(j,:))/length(k);
end
%for tt=1:max(MAX2)
 %   k2=find(fI2(tt,:));
  %  fI(tt)=sum(fI2(tt,:))/length(k2);
%end
T=1:1:max(MAX);
end