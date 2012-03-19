%ch4_3c

clear all
clc

load ch4data
x=data;
XYZ=[ -.41 0.82 .88;.14 .72 4.1;-.81 .61 -.38]';

p=zeros(1,size(XYZ,2));

r=0;
stepdist=.01;

n=size(x,2);

r_max=4;
k=3

for i=1:numel(p)
    r=0;
    kn=howmanyin(x,[XYZ(i)],r);
    while kn<k
        r=r+stepdist;
        if r>r_max
            break;
        end
        kn=howmanyin(x,[XYZ(i)],r);
    end
    Vn=(4/3)*pi*r^3;
    p(i)=(kn/n)/Vn;
end

p