function [class]=PNN_Classifiction(w,a,x)

deltapow=0.01;

n_x=norm(x);
% if abs(n_x)<1e-6
%     x=zeros(size(x));
% else
x=x/norm(x);
% end



[n,c]=size(a);
g = zeros(1,c);
for k=1:n;
    netk=w(:,k)'*x;
    g(find(a(k,:)))=g(find(a(k,:)))+exp((netk-1)/deltapow);
end
[maxv,class] = max(g);