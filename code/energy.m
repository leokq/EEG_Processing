function [delta_energy,theta_energy,alpha_energy,beta_energy]=energy(data)
%函数功能：计算16通道的delta,theta,alpha,beta小波的能量
%每个样本1000个点
%输入：经过截断的16通道的信号
%输出：小波能量  16*（4*N1）
%date：2017/12/24

%energy=[];
delta_energy=[];theta_energy=[];alpha_energy=[];beta_energy=[];
n=length(data);
N=n/1000;

for j=1:16
    c_data=data(j,:);  %c_data每个通道的数据
    d=[];t=[];a=[];b=[];
    %w_energy=[];    %每个通道的小波能量
    for i=1:N
        w_data=c_data((i-1)*1000+1:i*1000);
        [delta,theta,alpha,beta]=wavelete_energy_decompose(w_data);
        d=[d delta];t=[t theta];a=[a alpha];b=[b beta];
        %w_energy=[w_energy [delta,theta,alpha,beta]];
    end
    delta_energy=[delta_energy;d];theta_energy=[theta_energy;t];alpha_energy=[alpha_energy;a];beta_energy=[beta_energy;b];
    %energy=[energy;w_energy];
end

