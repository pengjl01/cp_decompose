function X = loaddata(dataname,startweek,endweek,inputindex,outputindex)
X_data=[];%��Ϊ��֪������೤���ж����ܣ�ʵ���޷�ΪX����Ԥ����
for i=startweek:endweek
    tempX=xlsread(dataname, i);
    X_data=[X_data;tempX];
end
num=size(X_data,1);
dim=length(inputindex);
sz=zeros(1,dim);
indexs=zeros(num,dim);
for i=1:dim%����Ϊindexs��ֵ
   sz(i)=max(X_data(:,inputindex(i)));
   indexs(:,i)=X_data(:,inputindex(i));
end
indexs=int32(indexs);%��������ᱨ�����ɰ汾���ᣬ�ǳ����
xavg=@(x) sum(x) / length(x);
X=sptensor(indexs,X_data(:,outputindex),sz,xavg);