
%Each Variable consists of 4096 samples of one EEG time series in ASCII code. 
%��.mat�ļ���ʽ�������S������ ����Ϊsingal.mat
%���� 0.5 Hz to 85 Hz
%fs=1000;%����Ƶ��
%dalt=1/fs;%�������
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
% [DATAfile DATApath]=uigetfile('*.txt','�����ź�');
% zz=[];
% FILENAME=[DATApath,DATAfile];
% zz=load(FILENAME);
% % zz=zz';
% N=length(zz);
% n=0:N-1;
%function 
function wt(data)
fs=1000;%����Ƶ��
dalt=1/fs;%�������
%load('E:\new1.mat');%װ���ź�
s=data;
t=0:length(s)-1*dalt;
figure(1);
subplot(311);plot(s);title('ԭʼ�ź�');
axis([-10 5000 -200 200]);
eeg_fft=fft(s,1024);%���ٸ��ϱ任
pp=eeg_fft.*conj(eeg_fft)/1024;%���㹦����
ff=(0:511)/1000/dalt;%��������Ӧ��Ƶ��ֵ
subplot(312);plot(ff,pp(1:512));ylabel('�������ܶ�');xlabel('Ƶ��');title('�źŹ�����');axis([0 55 -10 1000]);
l=wmaxlev(s,'db4');%ȡdb4�ֽ����s�����߶�l ʵ�ʷֽ�߶�С��l
sd=wden(s,'minimaxi','s','mln',real(l),'db4');%���� dbN �Գ� minimaxi�ü���Сԭ�������ֵѡ��  's'Ϊ����ֵ 'mln'�ڲ�ͬ����������㲢������ֵ
subplot(313);plot(sd);xlabel('�˳������ź�');axis([-10 4200 -200 200]);

[C,L]=wavedec(s,8,'db4'); %��С��db4���źŽ��ж�߶ȷֽ⣨7�㣩
%ϸ��ϵ��
D7=detcoef(C,L,7);%�߶�128
D6=detcoef(C,L,6);%�߶�64
D5=detcoef(C,L,5);%�߶�32
D4=detcoef(C,L,4);%�߶�16
D3=detcoef(C,L,3);%�߶�8
D2=detcoef(C,L,2);%�߶�4
D1=detcoef(C,L,1);%�߶�2
figure(2);
subplot(711);plot(D7);ylabel('D7');title('ϸ��ϵ��');
subplot(712);plot(D6);ylabel('D6');
subplot(713);plot(D5);ylabel('D5');
subplot(714);plot(D4);ylabel('D4'); 
subplot(715);plot(D3);ylabel('D3');
subplot(716);plot(D2);ylabel('D2');
subplot(717);plot(D1);ylabel('D1');

%����ϵ�� 
A7=appcoef(C,L,'db4',7);%�߶�128
A6=appcoef(C,L,'db4',6);% �߶�64
A5=appcoef(C,L,'db4',5);%�߶�32
A4=appcoef(C,L,'db4',4);%�߶�16
A3=appcoef(C,L,'db4',3);%�߶�8
A2=appcoef(C,L,'db4',2);%�߶�4
A1=appcoef(C,L,'db4',1);%�߶�2
figure(3);
subplot(711);plot(A7);ylabel('A7');title('����ϵ��');
subplot(712);plot(A6);ylabel('A6');
subplot(713);plot(A5);ylabel('A5');
subplot(714);plot(A4);ylabel('A4'); 
subplot(715);plot(A3);ylabel('A3');
subplot(716);plot(A2);ylabel('A2');
subplot(717);plot(A1);ylabel('A1');

%���� 0.5 Hz to 85 Hz;����Ƶ��fs=173.61Hz
%��-wave(1~4Hz);��-wave(4~8Hz);��-wave(8~13Hz);��-wave(14~30Hz);
%******************************
SRC8=wrcoef('a',C,L,'db4',8); 
SRC7=wrcoef('a',C,L,'db4',7);            %�÷ֽ�ϵ���ع�
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
delta=[SRC8];%��-wave(1~4Hz) 
thelta=[SRD8];%��-wave(4~8Hz)
alpha=[SRD7];%��-wave(8~13Hz)
belta=[SRD6];%��-wave(14~30Hz)
%delta
fs1=fft(delta,1024);%���ٸ��ϱ任
pp1=fs1.*conj(fs1)/1024;%���㹦����
ff1=((0:511)/1024)*1000;%��������Ӧ��Ƶ��ֵ
%thelta
fs2=fft(thelta,1024);%���ٸ��ϱ任
pp2=fs2.*conj(fs2)/1024;%���㹦����
ff2=((0:511)/1024)*1000;%��������Ӧ��Ƶ��ֵ
%alpha
fs3=fft(alpha,1024);%���ٸ��ϱ任
pp3=fs3.*conj(fs3)/1024;%���㹦����
ff3=((0:511)/1024)*1000;%��������Ӧ��Ƶ��ֵ
%belta
fs4=fft(belta,1024);%���ٸ��ϱ任
pp4=fs4.*conj(fs4)/1024;%���㹦����
ff4=((0:511)/1024)*1000;%��������Ӧ��Ƶ��ֵ
figure(4);%����������ȡ
subplot(411);plot(ff1,pp1(1:512));ylabel('�������ܶ�');title('delta�źŹ�����');axis([0 50 -10 110000]);
subplot(412);plot(ff2,pp2(1:512));ylabel('�������ܶ�');title('thelta�źŹ�����');axis([0 50 -10 110000]);
subplot(413);plot(ff3,pp3(1:512));ylabel('�������ܶ�');title('alpha�źŹ�����');axis([0 50 -10 110000]);
subplot(414);plot(ff4,pp4(1:512));ylabel('�������ܶ�');xlabel('Ƶ��');title('belta�źŹ�����');axis([0 50 -10 110000]);

figure(5);
subplot(311);xlabel('ʱ��   t/s');ylabel('Ƶ��   f/Hz');zlabel('��ֵ   A/uV');
c = cwt(s,[64 32 16:-2:2],'morl','3Dlvl'); %morlֻ�ܽ�������С���任 morl���жԳ��ԣ�����������ϵ������������֧��������
subplot(312);xlabel('ʱ��   t/s');ylabel('Ƶ��   f/Hz');zlabel('��ֵ   A/uV');
c = cwt(s,[16 8 4 2 1],'morl','3Dlvl'); %morl��������С���任  'lvl' By scale��ͬ�߶ȶԱ�
subplot(313);xlabel('ʱ��   t/s');ylabel('Ƶ��   f/Hz');zlabel('��ֵ   A/uV');
c = cwt(s,[16 8 4 2 1],'mexh','3Dlvl');%��mexihat��������С���任 ��ͬС���Ա�


