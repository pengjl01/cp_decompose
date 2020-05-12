%一次训练所有所需数据
clear all;
acc=2000;
loop=10000;
R=5;
startweek=1;
endweek=17;
path0='./ans/';

% path='3dim_9';
% inputindex=[2,12,13];
% note='预测45分钟后';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
% path='3dim_2';
% inputindex=[2,5,6];
% note='预测10分钟后';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
% path='3dim_3';
% inputindex=[2,6,7];
% note='预测15分钟后';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
% path='3dim_4';
% inputindex=[2,7,8];
% note='预测20分钟后';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
% path='3dim_5';
% inputindex=[2,8,9];
% note='预测25分钟后';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
% path='3dim_6';
% inputindex=[2,9,10];
% note='预测30分钟后';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
% path='3dim_7';
% inputindex=[2,10,11];
% note='预测35分钟后';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
% path='3dim_8';
% inputindex=[2,11,12];
% note='预测40分钟后';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
% path='3dim_notime';
% inputindex=[4,5,6];
% note='三维，无时段';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
%标准4维
% path='4dim';
% inputindex=[2,4,5,6];
% note='四维，标准';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);
% 
%三维R=1-15
% for r=1:15
%    path=['3dim_r' num2str(r)];
%    inputindex=[2,4,5];
%    note=['秩' num2str(r) '分解'];
%    train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',r);
% end
% 
%标准3维
% path='3dim_1';
% inputindex=[2,4,5];
% note='预测5分钟后';
% train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);

% 三维R=1-10
for r=1:10
   path=['3dim_r' num2str(r)];
   inputindex=[2,4,5];
   note=['秩' num2str(r) '分解'];
   train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',r);
end

%标准3维
path='3dim';
inputindex=[2,4,5];
note='3维，标准';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);

%标准4维
path='4dim';
inputindex=[2,4,5,6];
note='4维，标准';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);

%标准5维
path='5dim';
inputindex=[2,4,5,6,7];
note='5维，标准';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);

%标准6维
path='6dim';
inputindex=[2,4,5,6,7,8];
note='6维，标准';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);

%标准7维
path='7dim';
inputindex=[2,4,5,6,7,8,9];
note='7维，标准';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note);

%3维30分钟后
path='3dim_6_R5';
inputindex=[2,9,10];
note='预测30分钟后，R=5';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',5);

path='3dim_6_R1';
inputindex=[2,9,10];
note='预测30分钟后，R=1';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',1);

path='3dim_6_R10';
inputindex=[2,9,10];
note='预测30分钟后，R=1';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',10);

%5维30分钟后
path='5dim_6';
inputindex=[2,9,10,11,12];
note='预测30分钟后，R=5';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',5);

path='5dim_6_R1';
inputindex=[2,9,10,11,12];
note='预测30分钟后，R=1';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',1);

path='5dim_6_R10';
inputindex=[2,9,10,11,12];
note='预测30分钟后，R=1';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',10);



%大训练集 3维 R=1-10
for r=1:10
   path=['3dim_long_r' num2str(r)];
   inputindex=[2,4,5];
   note=['大训练集，R=' num2str(r) '分解'];
   train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',r,'startweek',1,'endweek',50);
end

%大训练集3维
path='3dim_long';
inputindex=[2,4,5];
note='3维，大训练集';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'startweek',1,'endweek',50);

%大训练集4维
path='4dim_long';
inputindex=[2,4,5,6];
note='4维，大训练集';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'startweek',1,'endweek',50);

%大训练集5维
path='5dim_long';
inputindex=[2,4,5,6,7];
note='5维，大训练集';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'startweek',1,'endweek',50);

%大训练集6维
path='6dim_long';
inputindex=[2,4,5,6,7,8];
note='6维，大训练集';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'startweek',1,'endweek',50);

%大训练集7维
path='7dim_long';
inputindex=[2,4,5,6,7,8,9];
note='7维，大训练集';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'startweek',1,'endweek',50);

%3维30分钟后大训练集
path='3dim_6_long_R5';
inputindex=[2,9,10];
note='预测30分钟后，R=5';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',5,'startweek',1,'endweek',50);

path='3dim_6_long_R1';
inputindex=[2,9,10];
note='预测30分钟后，R=1';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',1,'startweek',1,'endweek',50);

path='3dim_6_long_R10';
inputindex=[2,9,10];
note='预测30分钟后，R=1';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',10,'startweek',1,'endweek',50);

%5维30分钟后大训练集
path='5dim_6_long';
inputindex=[2,9,10,11,12];
note='预测30分钟后，R=5';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',5,'startweek',1,'endweek',50);

path='5dim_6_long_R1';
inputindex=[2,9,10,11,12];
note='预测30分钟后，R=1';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',1,'startweek',1,'endweek',50);

path='5dim_6_long_R10';
inputindex=[2,9,10,11,12];
note='预测30分钟后，R=1';
train([path0 path '/'],'inputindex',inputindex,'loop',loop,'note',note,'R',10,'startweek',1,'endweek',50);

system('shutdow5n -s');
