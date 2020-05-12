%张量的CP分解
%输入：
%     X：待分解张量
%     savepath：结果的保存路径
%     acc：精度（现一般使用loop作为结束条件）
%     R：分解的秩
%     dsave：保存文件的频率
%     t0：初始步长参数，用以计算初始步长
%     dt：逐步减小步长参数，也用于计算步数
%     dout：输出当前loss的频率
%     loop：循环次数作为结束条件
%     
%     
function cpd(X,savepath,varargin)
global A;
global now_step;
global now_loss;
global k;
ip = inputParser;
ip.addParameter('acc', 1000);
ip.addParameter('R', 5);
ip.addParameter('dsave', 100);
ip.addParameter('t0', 100000000000);
ip.addParameter('dt', 10);
ip.addParameter('dout', 100);
ip.addParameter('loop', 100000000);
ip.parse(varargin{:});
inputs=ip.Results;

t0=inputs.t0;
R=inputs.R;
acc=inputs.acc;
dt=inputs.dt;
dout=inputs.dout;
dsave=inputs.dsave;
loop=inputs.loop;

%设定超参数
t = t0;
dim=length(size(X));
%初始化
A=cell(1,dim);
KR=cell(1,dim);
for i=1:dim
    A{i}=rand(size(X,i),R);
end
[indexs, y] = find(X);
y_hat=zeros(length(y),1);
k=acc+1;
pre_loss=0;
sizes=zeros(1,dim);
for i=1:dim
    sizes(i)=size(X,i);
end
%主循环
tic;
while(abs(k)>acc)
    %更新拟合张量的值
    alpha=1/sqrt(t);
    for i=1:length(y)
        y_hat(i) = getvalue(indexs(i,:));
    end
    epsilon=y-y_hat;
    dX=alpha*sptensor(indexs,epsilon,sizes);
    %更新分解结果
    for i=1:dim
        KR{i}=mttkrp(dX,A,i);
    end
    for i=1:dim
        A{i}=A{i}+KR{i};
    end
    %更新损失函数值
    now_loss=sqrt(sum(epsilon.^2));
    k=(now_loss-pre_loss)/alpha;
    pre_loss=now_loss;
    %逐渐减小步长
    t = t + dt;
    %一定步数后输出loss值，保存
    now_step=(t-t0)/dt;
    if(mod(now_step,dout)==0)
        disp(['loop=' num2str(now_step) ' loss=' num2str(now_loss)]);
    end
    if(mod(now_step,dsave)==0)
        filename=[savepath 'ans' num2str(now_step/dsave) '.mat'];
        savefile(filename);
    end
    if(now_step>=loop)
        break;
    end
end
filename=[savepath 'ans' num2str(ceil(now_step/dsave)) '.mat'];
savefile(filename);
disp(['总循环次数=' num2str(now_step)]);
end
%保存当前状态至文件
function savefile(filename)
global A;
global now_step;
global now_loss;
global k;
now_dtime=toc;
save(filename,'A','now_step','now_loss','now_dtime','k');
disp([filename ' saved']);
end
%计算拟合值
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