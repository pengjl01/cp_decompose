function train(path,varargin)
ip = inputParser;
ip.addParameter('acc', 1000);
ip.addParameter('R', 5);
ip.addParameter('dsave', 100);
ip.addParameter('dout', 100);
ip.addParameter('startweek', 1);
ip.addParameter('endweek', 17);
ip.addParameter('inputindex', [2,4,5]);
ip.addParameter('outputindex', 1);
ip.addParameter('dataname', './data/sliced_traindata_2017.xlsx');
ip.addParameter('loop', 100000000);
ip.addParameter('t0', 10000000000000000);
ip.addParameter('note', '未命名');
ip.parse(varargin{:});
inputs=ip.Results;

R=inputs.R;
acc=inputs.acc;
dout=inputs.dout;
dsave=inputs.dsave;
startweek=inputs.startweek;
endweek=inputs.endweek;
inputindex=inputs.inputindex;
outputindex=inputs.outputindex;
dataname=inputs.dataname;
loop=inputs.loop;
t0=inputs.t0;
note=inputs.note;

if exist(path,'dir')
    rmdir(path,'s');
end
mkdir(path);
X =loaddata(dataname,startweek,endweek,inputindex,outputindex);
filename=[path 'parameters.mat'];
%下面两行看着非常臃肿，不知道能不能缩略
save(filename,'R','startweek','endweek','inputindex','outputindex','dataname','note');
cpd(X,path,'R',R,'acc',acc,'dout',dout,'dsave',dsave,'loop',loop);
