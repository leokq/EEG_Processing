function [delta_energy,theta_energy,alpha_energy,beta_energy]=energy(data)
%�������ܣ�����16ͨ����delta,theta,alpha,betaС��������
%ÿ������1000����
%���룺�����ضϵ�16ͨ�����ź�
%�����С������  16*��4*N1��
%date��2017/12/24

%energy=[];
delta_energy=[];theta_energy=[];alpha_energy=[];beta_energy=[];
n=length(data);
N=n/1000;

for j=1:16
    c_data=data(j,:);  %c_dataÿ��ͨ��������
    d=[];t=[];a=[];b=[];
    %w_energy=[];    %ÿ��ͨ����С������
    for i=1:N
        w_data=c_data((i-1)*1000+1:i*1000);
        [delta,theta,alpha,beta]=wavelete_energy_decompose(w_data);
        d=[d delta];t=[t theta];a=[a alpha];b=[b beta];
        %w_energy=[w_energy [delta,theta,alpha,beta]];
    end
    delta_energy=[delta_energy;d];theta_energy=[theta_energy;t];alpha_energy=[alpha_energy;a];beta_energy=[beta_energy;b];
    %energy=[energy;w_energy];
end

