function [p]=kn_nearest_neighbor_estimation_1D(x,k,myaxis)

p = zeros(size(myaxis));
r=0;stepdist=myaxis(2)-myaxis(1);
n=length(x);

for i=1:length(myaxis)
    r=0;
    kn=howmanyin(x,myaxis(i),r);
    while kn<k
        r=r+stepdist;
        if r>myaxis(length(myaxis))-myaxis(1)
            break;
        end
        kn=howmanyin(x,myaxis(i),r);
    end
    Vn=r*2;
    p(i)=(kn/n)/Vn;
end