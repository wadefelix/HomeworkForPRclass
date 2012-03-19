function [Path]=HMM_decode(aij,bjk,VT)
% HMM Decode
% ---------------------------------------
% aij is the transition probability array
% bjk is the probability array of the emission of a visible state
% VT  is a particular sequence of T visible states
% ע�⣺
% �������Ҫ���VT����������ʼ״̬����ֹ״̬�����������������ʼ״̬

VT=VT+1;%��1��Ϊ����һ�����꣬��ΪMatlab�е��±���1��ʼ��VT��0��ʼ
T = length(VT);
C = size(bjk,1);

Path=-ones(1,T);
alpha=zeros(C,T);
alpha0=zeros(C,1);alpha0(VT(1))=1;

Path(1)=VT(1)-1;Path(T)=VT(T)-1;
%��1��Ϊ�˰�ǰ��VTƽ�Ƽӵ�1������������������0�±꿪ʼ��VT

for t=1:T;
    for j=1:C;
        if VT(t+1)==1;% ������ֹ״̬�ͷ��أ���������
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