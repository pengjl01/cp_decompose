%计算拟合index位置张量的值
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