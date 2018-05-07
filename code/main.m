close all
clear all
clc

%addpath('F:\eeg\data_16\20171129\20171129_data\可用MAT\颜色\red');
%addpath('F:\eeg\data_16\20171129\20171129_data\可用MAT\颜色\green');
%addpath('F:\eeg\data_16\20171129\20171129_data\可用MAT\颜色\blue');

%加载数据
addpath('E:\EEG\code\code\data（1000）');
load('cly_red_s.mat');   
load('cly_green_s.mat'); 
load('cly_blue_s.mat');  
% load('cly_orange_s.mat'); 
% load('cly_purple_s.mat');
% load('cly_yellow_s.mat'); 
% load('cly_white_s.mat'); 
% load('cly_heise_s.mat');  

N1=length(red)/1000;    %红色样本个数
N2=length(green)/1000;  %绿色样本个数
N3=length(blue)/1000;   %蓝色样本个数
% N4=length(orange)/1000;
% N5=length(purple)/1000;
% N6=length(yellow)/1000;
% N7=length(white)/1000;
% N8=length(heise)/1000;

%计算红色各样本的最大值、最小值、均值、标准差、偏度
r_data=red(:,1:1000);
r_mean=mean(r_data')';
%去均值
r_data=r_data-repmat(r_mean,[1,1000]);
r_max=max(r_data')';r_min=min(r_data')';r_std=std(r_data')';r_ske=skewness(r_data')';r_k=kurtosis(r_data')';
for i=2:N1
    r_data=red(:,(i-1)*1000+1:i*1000);
    r_mean=[r_mean mean(r_data')'];
    r_data=r_data-repmat(mean(r_data')',[1,1000]);%去均值
    r_max=[r_max max(r_data')'];
    r_min=[r_min min(r_data')'];
    r_std=[r_std std(r_data')'];
    r_ske=[r_ske skewness(r_data')'];
    r_k=[r_k kurtosis(r_data')'];
end
%计算绿色各样本的最大值、最小值、均值、标准差、偏度
g_data=green(:,1:1000);
g_mean=mean(g_data')';
%去均值
g_data=g_data-repmat(g_mean,[1,1000]);
g_max=max(g_data')';g_min=min(g_data')';g_std=std(g_data')';g_ske=skewness(g_data')';g_k=kurtosis(g_data')';
for i=2:N2
    g_data=green(:,(i-1)*1000+1:i*1000);
    g_mean=[g_mean mean(g_data')'];
    g_data=g_data-repmat(mean(g_data')',[1,1000]);%去均值
    g_max=[g_max max(g_data')'];
    g_min=[g_min min(g_data')']; 
    g_std=[g_std std(g_data')'];
    g_ske=[g_ske skewness(g_data')'];
    g_k=[g_k kurtosis(g_data')'];
end
%计算蓝色各样本的最大值、最小值、均值、标准差、偏度
b_data=blue(:,1:1000);
b_mean=mean(b_data')';
%去均值
b_data=b_data-repmat(b_mean,[1,1000]);
b_max=max(b_data')';b_min=min(b_data')';b_std=std(b_data')';b_ske=skewness(b_data')';b_k=kurtosis(b_data')';
for i=2:N3
    b_data=blue(:,(i-1)*1000+1:i*1000);
    b_mean=[b_mean mean(b_data')'];
    b_data=b_data-repmat(mean(b_data')',[1,1000]);%去均值
    b_max=[b_max max(b_data')'];
    b_min=[b_min min(b_data')'];
    b_std=[b_std std(b_data')'];
    b_ske=[b_ske skewness(b_data')'];
    b_k=[b_k kurtosis(b_data')'];
end

% [r_max,r_min,r_std,r_ske,r_mean]=Statistcal_features(red,N1);
% [g_max,g_min,g_std,g_ske,g_mean]=Statistcal_features(green,N2);
% [b_max,b_min,b_std,b_ske,b_mean]=Statistcal_features(blue,N3);
% [o_max,o_min,0_std,o_ske]=Statistcal_features(orange,N4);
% [p_max,p_min,p_std,p_ske]=Statistcal_features(purple,N5);
% [y_max,y_min,y_std,y_ske]=Statistcal_features(yellow,N6);
% [w_max,w_min,w_std,w_ske]=Statistcal_features(white,N7);
% [h_max,h_min,h_std,h_ske]=Statistcal_features(heise,N8);


r_max_mean=mean(r_max');r_min_mean=mean(r_min');r_mean_mean=mean(r_mean');r_std_mean=mean(r_std');r_ske_mean=mean(r_ske');r_k_mean=mean(r_k');
g_max_mean=mean(g_max');g_min_mean=mean(g_min');g_mean_mean=mean(g_mean');g_std_mean=mean(g_std');g_ske_mean=mean(g_ske');g_k_mean=mean(g_k');
b_max_mean=mean(b_max');b_min_mean=mean(b_min');b_mean_mean=mean(b_mean');b_std_mean=mean(b_std');b_ske_mean=mean(b_ske');b_k_mean=mean(b_k');

% max_mean=[r_max_mean;g_max_mean;b_max_mean]';
% min_mean=[r_min_mean;g_min_mean;b_min_mean]';
% mean_mean=[r_mean_mean;g_mean_mean;b_mean_mean]';
% std_mean=[r_std_mean;g_std_mean;b_std_mean]';
ske_mean=[r_ske_mean;g_ske_mean;b_ske_mean]';
k_mean=[r_k_mean;g_k_mean;b_k_mean]';

%绘图
% figure(1);
% bar(max_mean);title('maximum');xlabel('channel') ;legend('red','green','blue');axis([0 17 0 300]);set(gca,'YGrid','on');
% figure(2);
% bar(min_mean);title('minimum');xlabel('channel') ;legend('red','green','blue');axis([0 17 -300 0]);set(gca,'ydir','reverse','XGrid','on');
% figure(3);
% bar(mean_mean);title('mean');xlabel('channel') ;legend('red','green','blue');axis([0 17 0 16]);set(gca,'YGrid','on');
% figure(4);
% bar(std_mean);title('std');xlabel('channel') ;legend('red','green','blue');axis([0 17 0 100]);set(gca,'YGrid','on');
% figure(1);
% bar(ske_mean);xlabel('skewness 通道') ;legend('red','green','blue');axis([0 17 -0.2 0.4]);set(gca,'YGrid','on');
% figure(6);
% bar(k_mean);xlabel('通道') ;legend('red','green','blue');%axis([0 17 -0.2 0.4]);set(gca,'YGrid','on');

%计算16个通道所有样本的delta、theta、Alpha、beta波的能量  
[r_d_energy,r_t_energy,r_a_energy,r_b_energy,]=energy(red);          
[g_d_energy,g_t_energy,g_a_energy,g_b_energy,]=energy(green);
[b_d_energy,b_t_energy,b_a_energy,b_b_energy,]=energy(blue);

% [o_d_energy,o_t_energy,o_a_energy,o_b_energy,]=energy(orange);
% [p_d_energy,p_t_energy,p_a_energy,p_b_energy,]=energy(purple);
% [y_d_energy,y_t_energy,y_a_energy,y_b_energy,]=energy(yellow);
% [w_d_energy,w_t_energy,w_a_energy,w_b_energy,]=energy(white);
% [h_d_energy,h_t_energy,h_a_energy,h_b_energy,]=energy(heise);

% 方便可视化比较，计算各小波的能量均值
d_energy=[mean(r_d_energy');mean(g_d_energy');mean(b_d_energy')]';
t_energy=[mean(r_t_energy');mean(g_t_energy');mean(b_t_energy')]';
a_energy=[mean(r_a_energy');mean(g_a_energy');mean(b_a_energy')]';
b_energy=[mean(r_b_energy');mean(g_b_energy');mean(b_b_energy')]';

%绘图
figure(2);
plot(d_energy);title('delta energy');xlabel('channel') ;legend('red','green','blue');%axis([0 17 0 500]);%set(gca,'YGrid','on');
figure(3);
plot(t_energy);title('thelta energy');xlabel('channel') ;legend('red','green','blue');%axis([0 17 0 500]);%set(gca,'YGrid','on');
figure(4);
plot(a_energy);title('alpha energy');xlabel('channel') ;legend('red','green','blue');%axis([0 17 0 500]);%set(gca,'YGrid','on');
figure(5);
plot(b_energy);title('beta energy');xlabel('channel') ;legend('red','green','blue');%axis([0 17 0 500]);%set(gca,'YGrid','on');

% r_featues = cat(1,r_ske(6,:),r_k(6,:),r_d_energy(1,:),r_d_energy(3,:),r_t_energy(8,:),r_t_energy(9,:),r_a_energy(10,:),r_b_energy(1,:),zeros(1,N1))';
% g_featues = cat(1,g_max(1,:),g_min(1,:),g_std(1,:),g_ske(6,:),g_d_energy(1,:),g_t_energy(9,:),g_a_energy(10,:),g_b_energy(1,:),ones(1,N2))';
% b_featues = cat(1,b_max(1,:),b_min(1,:),b_std(1,:),b_ske(6,:),b_d_energy(1,:),b_t_energy(9,:),b_a_energy(10,:),b_b_energy(1,:),zeros(1,N3))';b_featues(:,9) = 2;
% 
% % % o_featues = cat(1,o_max,o_min,o_std,o_ske,o_d_energy,b_t_energy,b_a_energy,b_b_energy,zeros(1,N4))';o_featues(:,7) = 3;
% % p_featues = cat(1,p_max,p_min,p_std,p_ske,p_d_energy,p_t_energy,p_a_energy,p_b_energy,zeros(1,N5))';p_featues(:,7) = 2;
% % y_featues = cat(1,y_max,y_min,y_std,y_ske,y_d_energy,y_t_energy,y_a_energy,y_b_energy,zeros(1,N6))';y_featues(:,7) = 2;
% % w_featues = cat(1,w_max,w_min,w_std,w_ske,w_d_energy,w_t_energy,w_a_energy,w_b_energy,zeros(1,N7))';w_featues(:,7) = 2;
% % % h_featues = cat(1,h_max,h_min,h_std,h_ske,h_d_energy,h_t_energy,h_a_energy,h_b_energy,zeros(1,N8))';h_featues(:,7) = 2;
% features = cat(1,r_featues,g_featues,b_featues);
% save('E:\EEG\最终\整理（1000）\feature-selection\features（3.25）.mat','features');
% figure(1);
% plot(ske_mean);xlabel('通道');legend('red','green','blue');axis([0 17 -  0.2 0.4]);
figure(1);
plot(k_mean);xlabel('通道');legend('red','green','blue');
