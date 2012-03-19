function [w,a] = PNN_Training(x,Tc,c)
% ���룺
% x Ϊ��������ÿ�д���һ������
% c Ϊ�������
% Tc ��x����������ÿ���������������ľ���
% �����
% w ��
% a ��
[m,n] = size(x);
a = zeros(n,c);
w = zeros(size(x));

for j=1:n;
    tempcol=x(:,j);
    tempnorm=norm(tempcol);
    
    if abs(tempnorm)<1e-6
        x(:,j)=zeros(m,1);
    else
    x(:,j)=tempcol./tempnorm;
    end
    
    w(:,j)=x(:,j);
    a(j,Tc(j))=1;
end