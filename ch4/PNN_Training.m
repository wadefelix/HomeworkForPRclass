function [w,a] = PNN_Training(x,Tc,c)
% 输入：
% x 为样本矩阵，每列代表一个样本
% c 为类别数量
% Tc 是x样本矩阵中每个样本所属的类别的矩阵
% 输出：
% w 是
% a 是
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