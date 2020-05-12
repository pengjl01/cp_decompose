%可以用在旧版数据上，已废弃
clear all;
global inputs;
global outputs;
global path;
global lossfile;
global testdata;
global R;
path0='./ans/(old/ans_missing/';
missing_num=1000;
path=[path0  num2str(missing_num) '/'];
startweek_test=52;
endweek_test=52;
startnum=1;
endnum=-1;
load([path 'missing_testdata']);
for i=startweek_test+1:endweek_test
    tempX=xlsread(dataname, i);
    testdata=[testdata;tempX];
end
testdata(:,2:4)=testdata(:,2:4)+1;
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
write_list(fileindex,A,B,C,now_loss,now_step,k);
end
function write_list(fileindex,A,B,C,now_loss,now_step,k)
global testdata;
global R;
global inputs;
global outputs;
Y_hat=zeros(length(testdata),1);
for j=1:length(testdata)
    for r=1:R
        Y_hat(j)=Y_hat(j)+A(testdata(j,1),r)*B(testdata(j,2),r)*C(testdata(j,3),r);
    end
end
delta=testdata(:,4)-Y_hat;
deltaPer=(testdata(:,4)-Y_hat)./testdata(:,4);

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
end
function draw(startnum,endnum)
global list_loss;
global list_delta_avg;
global list_delta_max;
global list_delta_min;
global list_step;
global list_deltaPer_avg;

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
plot(list_step(startnum:endnum),list_delta_max(startnum:endnum));
title('最大误差绝对值')
xlabel('训练次数');
ylabel('5分钟内车流量');
% plot(stepy,delta_min);
% title('最小误差绝对值')
% xlabel('训练次数');
% ylabel('5分钟车流量');
end