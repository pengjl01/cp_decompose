%展示结果
% clear all;
path1='./ans/';
%设定路径，不同路径代表不同参数下的运行结果
folder='3dim';
startweektest=20;
testweeknum=1;
drawindex=[1,-1];

global indexs;
global y;
global list;
path=[path1 folder '/'];
load([path 'parameters.mat']);
if startweektest==-1
    startweektest=endweek+1;%默认测试数据就跟在训练集后面
end
endweektest=startweektest+testweeknum;
if(exist('nowparameter','var')~=1)
    nowparameter=cell(1,5);
end

if ~(isequal(nowparameter{1},dataname)...
        && isequal(nowparameter{2},startweektest)...
        && isequal(nowparameter{3},endweektest)...
        && isequal(nowparameter{4},inputindex)...
        && isequal(nowparameter{5},outputindex))
    X =loaddata(dataname,startweektest,endweektest,inputindex,outputindex);
    [indexs, y] = find(X);
    nowparameter{1}=dataname;
    nowparameter{2}=startweektest;
    nowparameter{3}=endweektest;
    nowparameter{4}=inputindex;
    nowparameter{5}=outputindex;
end
lossfile=dir([path 'ans*.mat']);
if (drawindex(2)==-1)
    drawindex(2)=length(lossfile);%如果不设置画图范围，则画整个图
end
list=cell(2,5);%准备画图的几个数组
for i=1:5
   list{2*i-1}=zeros(length(lossfile),1);
end
%若需要画其他图形请修改此处和writelist函数 
list{2}='loss';
list{4}=['绝对平均误差MAE 真实流量均值为' num2str(mean(y))];
list{6}='绝对平均误差百分比';
list{8}='均方根误差RMSE';
list{10}='步数';
for i=1:length(lossfile)
    a=regexp(lossfile(i).name,'\d*\.?\d*','match');%截取文件名中的数值作为fileindex
    fileindex=str2double(cell2mat(a(1)));
    writelist(fileindex,[path lossfile(i).name]);
end
draw(drawindex,note);

%按照fileindex给数组赋值
function writelist(fileindex,filename)
global list;
global indexs;
global y;
load(filename);
y_hat=zeros(length(y),1);
for i=1:length(y)
    y_hat(i) = getvalue(indexs(i,:));
end
delta=y-y_hat;
deltaPer=delta./y;
%若需要画其他图形请修改此处和初始化时的数组名 
list{1}(fileindex)=now_loss;
list{3}(fileindex)=mean(abs(delta));
list{5}(fileindex)=mean(abs(deltaPer))*100;
list{7}(fileindex)=sqrt(mean(delta.^2));
list{9}(fileindex)=now_step;
end

%画图
function draw(drawindex,note)
global list;
figure('NumberTitle', 'off', 'Name', note);
for i=1:4
    subplot(2,2,i);
    plot(list{9}(drawindex(1):drawindex(2)),list{2*i-1}(drawindex(1):drawindex(2)));
    title(list{2*i});
    hold on;
    ymin=min(list{2*i-1});
    xmin=find(list{2*i-1}==ymin);
    line([0,list{9}(xmin)],[ymin,ymin],'linestyle',':');
    line([list{9}(xmin),list{9}(xmin)],[0,ymin],'linestyle',':');
    text(list{9}(xmin),ymin,['(' num2str(list{9}(xmin)) ',' num2str(ymin) ')']);
end
end