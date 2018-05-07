function [c_data]=data_jieduan(EEG,m,n)
%addpath('C:\Users\junxiao\Desktop\情绪识别\数据\可用MAT\情绪\悲伤');
%load('cly_s1.mat');
[r,c]=size(EEG);


%m=500;   %步长
%n=1000;   %数据长度
jd_data = EEG(:,1:n);  

c_data = jd_data;   %c_data用于存储扩充样本量后的所有样本数。

for i=2:floor((c-n)/m)-1
    
    jd_data = EEG(:,(i-1)*m+1 : (i+1)*m);
    c_data = [c_data jd_data];
    
end
c_data = [c_data EEG(:,c-n+1:c)];

