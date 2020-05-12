
clear all;
dmissing_num=1000;
maxnum=15;
acc=50;
R=5;
startweek=1;
endweek=17;
inputs=[1,3,5];
outputs=8;
path0='./ans/ans_missing123/';

if exist(path0,'dir')
    rmdir(path0,'s');
end
dataname='./data/sliced_traindata_2017.xlsx';
X_data=xlsread(dataname, startweek);
for i=startweek+1:endweek
    tempX=xlsread(dataname, i);
    X_data=[X_data;tempX];
end
dim=length(inputs);
for i=1:dim
   sz(i)=max(X_data(:,inputs(i)));
   inputdata(:,i)=X_data(:,inputs(i));
end
xavg=@(x) sum(x) / length(x);
X=sptensor(inputdata,X_data(:,outputs),sz,xavg);
[data(:,1:3), data(:,4)] = find(X);
for loopnum=1:maxnum
    missing_num=loopnum*dmissing_num;
    path=[path0 num2str(missing_num) '/'];
    mkdir(path);
    for num = 1 : length(data) - 1
        change = randi([num + 1, length(data)]);
        temp = data(num,:);
        data(num,:) = data(change,:);
        data(change,:) = temp;
    end
    testdata=data(1:missing_num,:);
    dataname=[path 'missing_testdata.mat'];
    save(dataname,'testdata');
    traindata=data(missing_num+1:length(data),:);
    filename=[path 'parameters.mat'];
    save(filename,'R','startweek','endweek','inputs','outputs');
    X1=sptensor(traindata(:,1:3),traindata(:,4),sz);
    cpd_demo(X1,path0,'acc',1000);  
end
