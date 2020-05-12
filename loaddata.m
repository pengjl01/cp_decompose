function X = loaddata(dataname,startweek,endweek,inputindex,outputindex)
X_data=[];%因为不知道具体多长，有多少周，实在无法为X进行预分配
for i=startweek:endweek
    tempX=xlsread(dataname, i);
    X_data=[X_data;tempX];
end
num=size(X_data,1);
dim=length(inputindex);
sz=zeros(1,dim);
indexs=zeros(num,dim);
for i=1:dim%按列为indexs赋值
   sz(i)=max(X_data(:,inputindex(i)));
   indexs(:,i)=X_data(:,inputindex(i));
end
indexs=int32(indexs);%不加这里会报错，而旧版本不会，非常奇怪
xavg=@(x) sum(x) / length(x);
X=sptensor(indexs,X_data(:,outputindex),sz,xavg);