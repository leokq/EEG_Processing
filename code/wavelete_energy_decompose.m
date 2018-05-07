function [x_delta,x_theta,x_alpha,x_beta]=wavelete_energy_decompose(x)
%С���ֽ�
[c,l]=wavedec(x,7,'db4');
%����ĳ����Ƕ��ź���С�����зֽ⡣
ca7=wrcoef('a',c,l,'db4',7);%0-3.9       delta��
cd7=wrcoef('d',c,l,'db4',7);%3.9-7.8      theta��
cd6=wrcoef('d',c,l,'db4',6);%7.8-15.6     alpha��
cd5=wrcoef('d',c,l,'db4',5);%15.6-31.25   beta��
cd4=wrcoef('d',c,l,'db4',4);%31.25-62.5   gamma��



%����ĳ����Ƕ�С���ֽ�Ľ����źŵ�ϵ����ȡ
%N=[1,2,3,4,5,6,7,8];
%[D1,D2,D3,D4,D5,D6,D7,D8]=detcoef(c,l,[N(1),N(2),N(3),N(4),N(5),N(6),N(7),N(8)]);
%A7=appcoef(c,l,'db4',7);

%%%��deltaϵ������Ժ�
%x_delta=sum(abs(A8)^2);
x_delta=sum(abs((ca7)).^2)/100000;
%%%thetaϵ��
%x_theta=sum(abs(D8)^2);
x_theta=sum(abs((cd7)).^2)/10000;
%%%alphaϵ��
%x_alpha=sum(abs(D7)^2);
x_alpha=sum(abs((cd6)).^2)/100000;
%%%betaϵ��
%x_beta=sum(abs(D6)^2);
x_beta=sum(abs((cd5)).^2)/10000;

% %%������һ��
% energy_sum=x_delta+x_theta+x_alpha+x_beta;
% x_delta=x_delta/energy_sum;
% x_theta=x_theta/energy_sum;
% x_alpha=x_alpha/energy_sum;
% x_beta=x_beta/energy_sum;
