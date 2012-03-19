function [class]=PNN_Classification(w,a,x,delta)
%% Probabilistic Neural Network Classification
% -----------------------------------------------
% delta : a parameter set by user and determines the width of the effective Gaussian window
% w and a are generated by PNN_Training function
% x is the data to be classificated
[m,n]=size(x);
calss=zeros(1,n);
for i=1:n;
    class(i)=subf_PNN_Classifiction(w,a,x(:,i),delta);
end
return

%% SubFunction
function [class]=subf_PNN_Classifiction(w,a,x,delta)
deltapow=delta.^2;
n_x=norm(x);

if abs(n_x)<1e-6
     x=zeros(size(x));
else
x=x/n_x;
end

[n,c]=size(a);
g = zeros(1,c);
for k=1:n;
    netk=w(:,k)'*x;
    g(find(a(k,:)))=g(find(a(k,:)))+exp((netk-1)/(deltapow));
end
[maxv,class] = max(g);
% EOF