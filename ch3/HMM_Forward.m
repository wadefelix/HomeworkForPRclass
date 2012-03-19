function [p] = HMM_Forward(aij,bjk,VT,w_init)
% HMM Forward
% ---------------------------------------
% aij is the transition probability array
% bjk is the probability array of the emission of a visible state
% VT  is a particular sequence of T visible states
% w_init  is the initial state
T = length(VT);
C = size(bjk,1);

alpha = zeros(C,T);
% alpha矩阵有C行T列，C隐状态的数量，T为观察序列的时间长度
% alpha(c,t)表示时间t处处于c隐状态,且发出了t处的观测状态的几率

alphaj0=zeros(C,1);
% w_init=1+1;%初始的隐状态
alphaj0(w_init,1)=1;

for t=1:T;
    for c=1:C;
        if t==1;
            alpha(c,t)=alphaj0'*aij(:,c)*bjk(c,VT(t)+1);
        else
            alpha(c,t)=alpha(:,t-1)'*aij(:,c)*bjk(c,VT(t)+1);
        end
    end
end

p=alpha(1,T);
%EOF