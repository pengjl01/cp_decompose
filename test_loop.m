%可以用在旧版数据上，已废弃
%查看不同训练次数对结果的影响
clear all;
global inputs;
global outputs;
global path;
global lossfile;
global testdata;
global R;
path='./ans/(old/ans_loop/3dim/';
startweek_test=16;
endweek_test=16;
startnum=1;
endnum=-1;
dataname='./data/sliced_traindata_2017.xlsx';
testdata=xlsread(dataname, startweek_test);
for i=startweek_test+1:endweek_test
    tempX=xlsread(dataname, i);
    testdata=[testdata;tempX];
end
lossfile=dir([path 'ans*.mat']);
figure('NumberTitle', 'off', 'Name', '训练次数对结果的影响');

if (endnum==-1)
    endnum=length(lossfile);
end
global list_loss;
list_loss=zeros(length(lossfile),1);
global list_delta_avg;
list_delta_avg=zeros(length(lossfile),1);
global list_delta_max;
list_delta_max=zeros(length(lossfile),1);
global list_delta_min;
list_delta_min=zeros(length(lossfile),1);
global list_step;
list_step=zeros(length(lossfile),1);
global list_deltaPer_avg;
list_deltaPer_avg=zeros(length(lossfile),1);
global list_k;
list_k=zeros(length(lossfile),1);
global list_mse;
list_mse=zeros(length(lossfile),1);
global list_msePer;
list_msePer=zeros(length(lossfile),1);

load([path 'parameters.mat']);
for i=1:length(lossfile)
    calc_gdata(i);
end
draw(startnum,endnum);

function calc_gdata(i)
global path;
global lossfile;
load([path lossfile(i).name]);
a=regexp(lossfile(i).name,'\d*\.?\d*','match');
fileindex=str2double(cell2mat(a(1)));
write_list(fileindex,A,now_loss,now_step,k);
end
function write_list(fileindex,A,now_loss,now_step,k)
global testdata;
global R;
global inputs;
global outputs;
dim=length(A);
Y_hat=zeros(length(testdata),1);
for i=1:length(testdata)
    Y_hat(i)=getvalue(index)
end
delta=testdata(:,outputs)-Y_hat;
deltaPer=(testdata(:,outputs)-Y_hat)./testdata(:,outputs);

global list_loss;
list_loss(fileindex)=now_loss;
global list_delta_avg;
list_delta_avg(fileindex)=mean(abs(delta));
global list_delta_max;
list_delta_max(fileindex)=max(abs(delta));
global list_delta_min;
list_delta_min(fileindex)=min(abs(delta));
global list_step;
list_step(fileindex)=now_step;
global list_deltaPer_avg;
list_deltaPer_avg(fileindex)=mean(abs(deltaPer))*100;
global list_k;
list_k(fileindex)=k;
global list_mse;
list_mse(fileindex)=sqrt(mean(delta.^2));
global list_msePer;
list_msePer(fileindex)=sqrt(mean(deltaPer.^2));
end
function draw(startnum,endnum)
global list_loss;
global list_delta_avg;
global list_delta_max;
global list_delta_min;
global list_step;
global list_deltaPer_avg;
global list_mse;
global list_msePer;

subplot(2,2,1);
plot(list_step(startnum:endnum),list_delta_avg(startnum:endnum));
title('平均误差绝对值');
xlabel('训练次数');
ylabel('5分钟内车流量');

subplot(2,2,2);
plot(list_step(startnum:endnum),list_deltaPer_avg(startnum:endnum));
title('平均误差百分比（绝对值）')
xlabel('训练次数');
ylabel('%');

subplot(2,2,3);
plot(list_step(startnum:endnum),list_loss(startnum:endnum));
title('loss值')
xlabel('训练次数');
ylabel('loss');

subplot(2,2,4);
plot(list_step(startnum:endnum),list_mse(startnum:endnum));
title('均方根误差SMSE')
xlabel('训练次数');
ylabel('SMSE');

% plot(list_msePer(startnum:endnum),list_msePer(startnum:endnum));
% title('百分误差的均方根误差')
% xlabel('训练次数');
% ylabel('SMSE_Per');
% plot(list_step(startnum:endnum),list_delta_max(startnum:endnum));
% title('最大误差绝对值')
% xlabel('训练次数');
% ylabel('5分钟内车流量');
% plot(stepy,delta_min);
% title('最小误差绝对值')
% xlabel('训练次数');
% ylabel('5分钟车流量');
end
function value=getvalue(index)
global A;
R=size(A{1},2);
value=0;
for r=1:R
    temp=1;
    for d=1:length(index)
       temp=temp*A{d}(index(d),r);
    end
    value=value+temp;
end
end