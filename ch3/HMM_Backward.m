function [p] = HMM_Backward(aij,bjk,VT,w_init)
% HMM Backward
% ---------------------------------------
% aij is the transition probability array
% bjk is the probability array of the emission of a visible state
% VT  is a particular sequence of T visible states
% w_init  is the initial state

T = length(VT);
C = size(bjk,1);

beta = zeros(C,T);
betaT = zeros(C,1);
betaT(VT(T)+1,1)=1;

for t=T:-1:1;
    for i=1:C;
        if t==T;
            %beta(i,t)=aij(i,:)*betaT*bjk(i,VT(t)+1);
            beta(i,t)=calcb(aij(i,:),bjk(:,VT(t)+1),VT(t),betaT,T);
        else
            %beta(i,t)=aij(i,:)*beta(:,t+1)*bjk(i,VT(t)+1);
            beta(i,t)=calcb(aij(i,:),bjk(:,VT(t)+1),VT(t),beta(:,t+1),T);
        end
    end
end

p=beta(w_init,1);

% SubFunction to calculate beta(i,t)
function [b]=calcb(aijrow,bjkcul,VTt,betacul,length_VT)
b=0;
for j=1:length_VT;
    b=b+betacul(j,1)*aijrow(1,j)*bjkcul(j,1);
end
% EOF