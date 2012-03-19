function [b]=calcb(aijrow,bjk,VTt,i,t,betacul,length_VT)
b=0;
for j=1:length_VT;
    b=b+betacul(j,1)*aijrow(1,j)*bjk(j,VTt+1);
end