%һ��ѵ��������������
clear all;
acc=2000;
loop=10000;
R=5;
startweek=1;
endweek=17;
path0='./ans/';

% path='3dim_9';
% inputindex=[2,12,13];
% note='Ԥ��45���Ӻ�';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
% path='3dim_2';
% inputindex=[2,5,6];
% note='Ԥ��10���Ӻ�';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
% path='3dim_3';
% inputindex=[2,6,7];
% note='Ԥ��15���Ӻ�';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
% path='3dim_4';
% inputindex=[2,7,8];
% note='Ԥ��20���Ӻ�';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
% path='3dim_5';
% inputindex=[2,8,9];
% note='Ԥ��25���Ӻ�';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
% path='3dim_6';
% inputindex=[2,9,10];
% note='Ԥ��30���Ӻ�';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
% path='3dim_7';
% inputindex=[2,10,11];
% note='Ԥ��35���Ӻ�';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
% path='3dim_8';
% inputindex=[2,11,12];
% note='Ԥ��40���Ӻ�';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
% path='3dim_notime';
% inputindex=[4,5,6];
% note='��ά����ʱ��';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
%��׼4ά
% path='4dim';
% inputindex=[2,4,5,6];
% note='��ά����׼';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
%��άR=1-15
% for r=1:15
%    path=['3dim_r' num2str(r)];
%    inputindex=[2,4,5];
%    note=['��' num2str(r) '�ֽ�'];
%    train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',r);
% end
% 
%��׼3ά
% path='3dim_1';
% inputindex=[2,4,5];
% note='Ԥ��5���Ӻ�';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);

% ��άR=1-10
for r=1:10
   path=['3dim_r' num2str(r)];
   inputindex=[2,4,5];
   note=['��' num2str(r) '�ֽ�'];
   train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',r);
end

%��׼3ά
path='3dim';
inputindex=[2,4,5];
note='3ά����׼';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);

%��׼4ά
path='4dim';
inputindex=[2,4,5,6];
note='4ά����׼';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);

%��׼5ά
path='5dim';
inputindex=[2,4,5,6,7];
note='5ά����׼';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);

%��׼6ά
path='6dim';
inputindex=[2,4,5,6,7,8];
note='6ά����׼';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);

%��׼7ά
path='7dim';
inputindex=[2,4,5,6,7,8,9];
note='7ά����׼';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);

%3ά30���Ӻ�
path='3dim_6_R5';
inputindex=[2,9,10];
note='Ԥ��30���Ӻ�R=5';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',5);

path='3dim_6_R1';
inputindex=[2,9,10];
note='Ԥ��30���Ӻ�R=1';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',1);

path='3dim_6_R10';
inputindex=[2,9,10];
note='Ԥ��30���Ӻ�R=1';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',10);

%5ά30���Ӻ�
path='5dim_6';
inputindex=[2,9,10,11,12];
note='Ԥ��30���Ӻ�R=5';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',5);

path='5dim_6_R1';
inputindex=[2,9,10,11,12];
note='Ԥ��30���Ӻ�R=1';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',1);

path='5dim_6_R10';
inputindex=[2,9,10,11,12];
note='Ԥ��30���Ӻ�R=1';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',10);



%��ѵ���� 3ά R=1-10
for r=1:10
   path=['3dim_long_r' num2str(r)];
   inputindex=[2,4,5];
   note=['��ѵ������R=' num2str(r) '�ֽ�'];
   train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',r,'startweek',1,'endweek',50);
end

%��ѵ����3ά
path='3dim_long';
inputindex=[2,4,5];
note='3ά����ѵ����';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'startweek',1,'endweek',50);

%��ѵ����4ά
path='4dim_long';
inputindex=[2,4,5,6];
note='4ά����ѵ����';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'startweek',1,'endweek',50);

%��ѵ����5ά
path='5dim_long';
inputindex=[2,4,5,6,7];
note='5ά����ѵ����';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'startweek',1,'endweek',50);

%��ѵ����6ά
path='6dim_long';
inputindex=[2,4,5,6,7,8];
note='6ά����ѵ����';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'startweek',1,'endweek',50);

%��ѵ����7ά
path='7dim_long';
inputindex=[2,4,5,6,7,8,9];
note='7ά����ѵ����';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'startweek',1,'endweek',50);

%3ά30���Ӻ��ѵ����
path='3dim_6_long_R5';
inputindex=[2,9,10];
note='Ԥ��30���Ӻ�R=5';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',5,'startweek',1,'endweek',50);

path='3dim_6_long_R1';
inputindex=[2,9,10];
note='Ԥ��30���Ӻ�R=1';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',1,'startweek',1,'endweek',50);

path='3dim_6_long_R10';
inputindex=[2,9,10];
note='Ԥ��30���Ӻ�R=1';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',10,'startweek',1,'endweek',50);

%5ά30���Ӻ��ѵ����
path='5dim_6_long';
inputindex=[2,9,10,11,12];
note='Ԥ��30���Ӻ�R=5';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',5,'startweek',1,'endweek',50);

path='5dim_6_long_R1';
inputindex=[2,9,10,11,12];
note='Ԥ��30���Ӻ�R=1';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',1,'startweek',1,'endweek',50);

path='5dim_6_long_R10';
inputindex=[2,9,10,11,12];
note='Ԥ��30���Ӻ�R=1';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',10,'startweek',1,'endweek',50);

system('shutdow5n -s');
