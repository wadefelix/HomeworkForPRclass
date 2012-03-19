function [Path]=HMM_decode(aij,bjk,VT)
% HMM Decode
% ---------------------------------------
% aij is the transition probability array
% bjk is the probability array of the emission of a visible state
% VT  is a particular sequence of T visible states
% 注意：
% 这个函数要求的VT参数包含初始状态和终止状态，不用再另外输入初始状态

VT=VT+1;%加1是为了移一个坐标，因为Matlab中的下标是1开始，VT是0开始
T = length(VT);
C = size(bjk,1);

Path=-ones(1,T);
alpha=zeros(C,T);
alpha0=zeros(C,1);alpha0(VT(1))=1;

Path(1)=VT(1)-1;Path(T)=VT(T)-1;
%减1是为了把前面VT平移加的1减回来，函数返回以0下标开始的VT

for t=1:T;
    for j=1:C;
        if VT(t+1)==1;% 遇到终止状态就返回，不再运算
            return
        end
        if t==1;
            alpha(j,t)=bjk(j,VT(t))*alpha0'*aij(:,j);
        else
            alpha(j,t)=bjk(j,VT(t))*alpha(:,t-1)'*aij(:,j);
        end
    end
    if t~=T;
    [Temp Path(t+1)]=max(alpha(:,t));
    Path(t+1)=Path(t+1)-1;
    end
end
% EOF