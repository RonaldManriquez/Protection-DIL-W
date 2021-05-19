%protection comparison
delta=1/14;
s=2000;%nº simulations
aa=1;%nº infected 
%p=0.1;%protection budget
p=[0.05 0.1 0.15 0.2 0.25 0.3 0.4 0.5];
%rpro=round(N*p);% protected
tau=[0.27 0.12 0.23 0.0052 0.015 0.00125];% rho in the paper.
%2=G_sandy;
%3=G_birds;
%4=G_mat72
%5=G_zachary
%g=[2 3 4 5];
bb=8;
SRALL=zeros(bb,7); %Survival rate
g=4;%Grafos
alpha0=0;
alpha05=0.5;
alpha1=1;%alpha for DIL-W^{\alpha}
%%average simulations
for bbb=1:bb
[T0,P0,SR0]=simulation_average_deleted(tau,delta,aa,s,p(bbb),1,alpha0,g);
[T1,P1,SR1]=simulation_average_deleted(tau,delta,aa,s,p(bbb),1,alpha1,g);
[T2,P2,SR2]=simulation_average_deleted(tau,delta,aa,s,p(bbb),2,alpha1,g);
[T3,P3,SR3]=simulation_average_deleted(tau,delta,aa,s,p(bbb),3,alpha1,g);
[T4,P4,SR4]=simulation_average_deleted(tau,delta,aa,s,p(bbb),4,alpha1,g);
[T5,P5,SR5]=simulation_average_deleted(tau,delta,aa,s,p(bbb),5,alpha1,g);
[T05,P05,SR05]=simulation_average_deleted(tau,delta,aa,s,p(bbb),1,alpha05,g);
%%SIMULACION DE EPIDEMIA SIN PROTECCION
[T,P]=sim_w_p(delta,aa,s,tau,g);

SRALL(bbb,1)=SR0;
SRALL(bbb,2)=SR05;
SRALL(bbb,3)=SR1;
SRALL(bbb,4)=SR2;
SRALL(bbb,5)=SR3;
SRALL(bbb,6)=SR4;
SRALL(bbb,7)=SR5;
end
%q=plot(T0,P0,'r--',T05,P05,'r-',T1,P1,'r:',T2,P2,'b-',T3,P3,'k-',T4,P4,'y-',T5,P5,'c-',T,P,'m-');
%q(1).MarkerFaceColor='r';
%q(2).MarkerFaceColor='b';
%q(3).MarkerFaceColor='k';
%q(4).MarkerFaceColor='y';
%q(5).MarkerFaceColor='c';
%q(6).MarkerFaceColor='m';
%q(1).MarkerSize=7;
%q(2).MarkerSize=7;
%q(3).MarkerSize=7;
%q(4).MarkerSize=7;
%q(5).MarkerSize=7;
%q(6).MarkerSize=7;
%q(1).LineWidth=2.5;
%q(2).LineWidth=2.5;
%q(3).LineWidth=2.5;
%q(4).LineWidth=2.5;
%q(5).LineWidth=2.5;
%q(6).LineWidth=2.5;
%q(7).LineWidth=2.5;
%q(8).LineWidth=2.5;
%q(2).Color='[0 0.5 0]';
%q(2).MarkerFaceColor='[0 0.5 0]';
%q(3).MarkerFaceColor='r';
%q(2).MarkerEdgeColor='[0 0.5 0]';
%leg = {'\fontsize{12}Simulation','\fontsize{12}Average','\fontsize{12}Median'};
%lgd = legend({'DIL-W^{0}','DIL-W^{0.5}','DIL-W^{1}','Strength','Closeness','Betweenness','Laplacian','Without protection'},'FontSize',18);
%legend('boxoff');
%lgd(1).Interpreter='latex';
%xlabel('\fontsize{20}Time units','FontWeight','bold');%'Interpreter','latex'
%ylabel('\fontsize{20}Fraction of Infected','FontWeight','bold');
%ax = gca; % current axes
%ax.FontSize=12;
%ax.xlabel.FontSize=20;
%title('\fontsize{22}CAG-mat72 Network');%%cambiar titile % 
%Zachary karate club 
%Wild bird 
%Sandy authors
%CAG-mat72