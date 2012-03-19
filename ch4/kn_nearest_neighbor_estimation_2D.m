function [p]=kn_nearest_neighbor_estimation_2D(x,k,X,Y)

p = zeros(size(X));
r=0;
stepdist=min(norm(X(1,2)-X(1,1)),norm(Y(2,1)-Y(1,1)));

n=size(x,2);

r_max=norm([X(1,1),Y(1,1)]-[X(numel(X)),Y(numel(Y))]);

for i=1:numel(X)
    r=0;
    kn=howmanyin(x,[X(i),Y(i)],r);
    while kn<k
        r=r+stepdist;
        if r>r_max
            break;
        end
        kn=howmanyin(x,[X(i),Y(i)],r);
    end
    Vn=pi*r^2;
    p(i)=(kn/n)/Vn;
end