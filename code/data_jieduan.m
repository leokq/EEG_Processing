function [c_data]=data_jieduan(EEG,m,n)
%addpath('C:\Users\junxiao\Desktop\����ʶ��\����\����MAT\����\����');
%load('cly_s1.mat');
[r,c]=size(EEG);


%m=500;   %����
%n=1000;   %���ݳ���
jd_data = EEG(:,1:n);  

c_data = jd_data;   %c_data���ڴ洢�������������������������

for i=2:floor((c-n)/m)-1
    
    jd_data = EEG(:,(i-1)*m+1 : (i+1)*m);
    c_data = [c_data jd_data];
    
end
c_data = [c_data EEG(:,c-n+1:c)];

