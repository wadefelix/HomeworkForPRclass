function [result]=howmanyin(x,center,r)

result=0;

for i=1:size(x,2)
    xt=x(i);
    if norm(xt-center)<=r
        result=result+1;
    end
end