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
% alpha������C��T�У�C��״̬��������TΪ�۲����е�ʱ�䳤��
% alpha(c,t)��ʾʱ��t������c��״̬,�ҷ�����t���Ĺ۲�״̬�ļ���

alphaj0=zeros(C,1);
% w_init=1+1;%��ʼ����״̬
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