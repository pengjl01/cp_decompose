%新版画图，一次画全部
% clear all;
folder='3dim';
tic;
nowparameter=draw(folder);
toc;
tic;
for i=1:10
    folder=['3dim_r' num2str(i)];
    nowparameter=draw(folder,'nowparameter',nowparameter);
    toc;
    tic;
end

disp('test on train data');
folder='3dim_1';
nowparameter=draw(folder,'nowparameter',nowparameter,'startweektest', 1,'endweektest', 17);
toc;
tic;
for i=1:15
    folder=['3dim_r' num2str(i)];
    nowparameter=draw(folder,'nowparameter',nowparameter,'startweektest', 1,'endweektest', 17);
    toc;
    tic;
end

