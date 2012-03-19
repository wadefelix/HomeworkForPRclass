function [class]=PNN_Classifictions(w,a,x)
[m,n]=size(x);
calss=zeros(1,n);
for i=1:n;
    class(i)=PNN_Classifiction(w,a,x(:,i));
end