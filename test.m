%չʾ���
% clear all;
path1='./ans/';
%�趨·������ͬ·������ͬ�����µ����н��
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
    startweektest=endweek+1;%Ĭ�ϲ������ݾ͸���ѵ��������
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
    drawindex(2)=length(lossfile);%��������û�ͼ��Χ��������ͼ
end
list=cell(2,5);%׼����ͼ�ļ�������
for i=1:5
   list{2*i-1}=zeros(length(lossfile),1);
end
%����Ҫ������ͼ�����޸Ĵ˴���writelist���� 
list{2}='loss';
list{4}=['����ƽ�����MAE ��ʵ������ֵΪ' num2str(mean(y))];
list{6}='����ƽ�����ٷֱ�';
list{8}='���������RMSE';
list{10}='����';
for i=1:length(lossfile)
    a=regexp(lossfile(i).name,'\d*\.?\d*','match');%��ȡ�ļ����е���ֵ��Ϊfileindex
    fileindex=str2double(cell2mat(a(1)));
    writelist(fileindex,[path lossfile(i).name]);
end
draw(drawindex,note);

%����fileindex�����鸳ֵ
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
%����Ҫ������ͼ�����޸Ĵ˴��ͳ�ʼ��ʱ�������� 
list{1}(fileindex)=now_loss;
list{3}(fileindex)=mean(abs(delta));
list{5}(fileindex)=mean(abs(deltaPer))*100;
list{7}(fileindex)=sqrt(mean(delta.^2));
list{9}(fileindex)=now_step;
end

%��ͼ
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