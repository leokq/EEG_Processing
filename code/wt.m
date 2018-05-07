
%Each Variable consists of 4096 samples of one EEG time series in ASCII code. 
%以.mat文件格式保存变量S的数据 保存为singal.mat
%带宽 0.5 Hz to 85 Hz
%fs=1000;%采样频率
%dalt=1/fs;%采样间隔
% t=n/fs;
% plot(t,zz)
% [pf,a,si]=lmd2(zz);

% -11
% 8
% 77];
% save singal dalt sig;

% %fs=173.61Hz;
% clear;
% clc;
% [DATAfile DATApath]=uigetfile('*.txt','输入信号');
% zz=[];
% FILENAME=[DATApath,DATAfile];
% zz=load(FILENAME);
% % zz=zz';
% N=length(zz);
% n=0:N-1;
%function 
function wt(data)
fs=1000;%采样频率
dalt=1/fs;%采样间隔
%load('E:\new1.mat');%装载信号
s=data;
t=0:length(s)-1*dalt;
figure(1);
subplot(311);plot(s);title('原始信号');
axis([-10 5000 -200 200]);
eeg_fft=fft(s,1024);%快速付氏变换
pp=eeg_fft.*conj(eeg_fft)/1024;%计算功率谱
ff=(0:511)/1000/dalt;%计算各点对应的频率值
subplot(312);plot(ff,pp(1:512));ylabel('功率谱密度');xlabel('频率');title('信号功率谱');axis([0 55 -10 1000]);
l=wmaxlev(s,'db4');%取db4分解变量s的最大尺度l 实际分解尺度小于l
sd=wden(s,'minimaxi','s','mln',real(l),'db4');%除噪 dbN 对称 minimaxi用极大极小原理进行阈值选择  's'为软阈值 'mln'在不同层估计噪声层并调整阈值
subplot(313);plot(sd);xlabel('滤除噪声信号');axis([-10 4200 -200 200]);

[C,L]=wavedec(s,8,'db4'); %用小波db4对信号进行多尺度分解（7层）
%细节系数
D7=detcoef(C,L,7);%尺度128
D6=detcoef(C,L,6);%尺度64
D5=detcoef(C,L,5);%尺度32
D4=detcoef(C,L,4);%尺度16
D3=detcoef(C,L,3);%尺度8
D2=detcoef(C,L,2);%尺度4
D1=detcoef(C,L,1);%尺度2
figure(2);
subplot(711);plot(D7);ylabel('D7');title('细节系数');
subplot(712);plot(D6);ylabel('D6');
subplot(713);plot(D5);ylabel('D5');
subplot(714);plot(D4);ylabel('D4'); 
subplot(715);plot(D3);ylabel('D3');
subplot(716);plot(D2);ylabel('D2');
subplot(717);plot(D1);ylabel('D1');

%近似系数 
A7=appcoef(C,L,'db4',7);%尺度128
A6=appcoef(C,L,'db4',6);% 尺度64
A5=appcoef(C,L,'db4',5);%尺度32
A4=appcoef(C,L,'db4',4);%尺度16
A3=appcoef(C,L,'db4',3);%尺度8
A2=appcoef(C,L,'db4',2);%尺度4
A1=appcoef(C,L,'db4',1);%尺度2
figure(3);
subplot(711);plot(A7);ylabel('A7');title('近似系数');
subplot(712);plot(A6);ylabel('A6');
subplot(713);plot(A5);ylabel('A5');
subplot(714);plot(A4);ylabel('A4'); 
subplot(715);plot(A3);ylabel('A3');
subplot(716);plot(A2);ylabel('A2');
subplot(717);plot(A1);ylabel('A1');

%带宽 0.5 Hz to 85 Hz;采样频率fs=173.61Hz
%δ-wave(1~4Hz);θ-wave(4~8Hz);α-wave(8~13Hz);β-wave(14~30Hz);
%******************************
SRC8=wrcoef('a',C,L,'db4',8); 
SRC7=wrcoef('a',C,L,'db4',7);            %用分解系数重构
SRC6=wrcoef('a',C,L,'db4',6);
SRC5=wrcoef('a',C,L,'db4',5);
SRC4=wrcoef('a',C,L,'db4',4);
SRC3=wrcoef('a',C,L,'db4',3);
SRC2=wrcoef('a',C,L,'db4',2);
SRC1=wrcoef('a',C,L,'db4',1);
SRD8=wrcoef('d',C,L,'db4',8);
SRD7=wrcoef('d',C,L,'db4',7);
SRD6=wrcoef('d',C,L,'db4',6); 
SRD5=wrcoef('d',C,L,'db4',5); 
SRD4=wrcoef('d',C,L,'db4',4); 
SRD3=wrcoef('d',C,L,'db4',3);             
SRD2=wrcoef('d',C,L,'db4',2);             
SRD1=wrcoef('d',C,L,'db4',1); 
delta=[SRC8];%δ-wave(1~4Hz) 
thelta=[SRD8];%θ-wave(4~8Hz)
alpha=[SRD7];%α-wave(8~13Hz)
belta=[SRD6];%β-wave(14~30Hz)
%delta
fs1=fft(delta,1024);%快速付氏变换
pp1=fs1.*conj(fs1)/1024;%计算功率谱
ff1=((0:511)/1024)*1000;%计算各点对应的频率值
%thelta
fs2=fft(thelta,1024);%快速付氏变换
pp2=fs2.*conj(fs2)/1024;%计算功率谱
ff2=((0:511)/1024)*1000;%计算各点对应的频率值
%alpha
fs3=fft(alpha,1024);%快速付氏变换
pp3=fs3.*conj(fs3)/1024;%计算功率谱
ff3=((0:511)/1024)*1000;%计算各点对应的频率值
%belta
fs4=fft(belta,1024);%快速付氏变换
pp4=fs4.*conj(fs4)/1024;%计算功率谱
ff4=((0:511)/1024)*1000;%计算各点对应的频率值
figure(4);%特征波形提取
subplot(411);plot(ff1,pp1(1:512));ylabel('功率谱密度');title('delta信号功率谱');axis([0 50 -10 110000]);
subplot(412);plot(ff2,pp2(1:512));ylabel('功率谱密度');title('thelta信号功率谱');axis([0 50 -10 110000]);
subplot(413);plot(ff3,pp3(1:512));ylabel('功率谱密度');title('alpha信号功率谱');axis([0 50 -10 110000]);
subplot(414);plot(ff4,pp4(1:512));ylabel('功率谱密度');xlabel('频率');title('belta信号功率谱');axis([0 50 -10 110000]);

figure(5);
subplot(311);xlabel('时间   t/s');ylabel('频率   f/Hz');zlabel('幅值   A/uV');
c = cwt(s,[64 32 16:-2:2],'morl','3Dlvl'); %morl只能进行连续小波变换 morl具有对称性，不生成正交系，不具有有限支集等性质
subplot(312);xlabel('时间   t/s');ylabel('频率   f/Hz');zlabel('幅值   A/uV');
c = cwt(s,[16 8 4 2 1],'morl','3Dlvl'); %morl进行连续小波变换  'lvl' By scale不同尺度对比
subplot(313);xlabel('时间   t/s');ylabel('频率   f/Hz');zlabel('幅值   A/uV');
c = cwt(s,[16 8 4 2 1],'mexh','3Dlvl');%用mexihat进行连续小波变换 不同小波对比


