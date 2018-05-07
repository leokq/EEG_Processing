function [x_delta,x_theta,x_alpha,x_beta]=wavelete_energy_decompose(x)
%小波分解
[c,l]=wavedec(x,7,'db4');
%下面的程序是对信号用小波进行分解。
ca7=wrcoef('a',c,l,'db4',7);%0-3.9       delta波
cd7=wrcoef('d',c,l,'db4',7);%3.9-7.8      theta波
cd6=wrcoef('d',c,l,'db4',6);%7.8-15.6     alpha波
cd5=wrcoef('d',c,l,'db4',5);%15.6-31.25   beta波
cd4=wrcoef('d',c,l,'db4',4);%31.25-62.5   gamma波



%下面的程序是对小波分解的近似信号的系数提取
%N=[1,2,3,4,5,6,7,8];
%[D1,D2,D3,D4,D5,D6,D7,D8]=detcoef(c,l,[N(1),N(2),N(3),N(4),N(5),N(6),N(7),N(8)]);
%A7=appcoef(c,l,'db4',7);

%%%对delta系数求绝对和
%x_delta=sum(abs(A8)^2);
x_delta=sum(abs((ca7)).^2)/100000;
%%%theta系数
%x_theta=sum(abs(D8)^2);
x_theta=sum(abs((cd7)).^2)/10000;
%%%alpha系数
%x_alpha=sum(abs(D7)^2);
x_alpha=sum(abs((cd6)).^2)/100000;
%%%beta系数
%x_beta=sum(abs(D6)^2);
x_beta=sum(abs((cd5)).^2)/10000;

% %%能量归一化
% energy_sum=x_delta+x_theta+x_alpha+x_beta;
% x_delta=x_delta/energy_sum;
% x_theta=x_theta/energy_sum;
% x_alpha=x_alpha/energy_sum;
% x_beta=x_beta/energy_sum;
