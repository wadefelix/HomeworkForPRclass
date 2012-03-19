clear all
close all
clc

load ch3data.mat

u_ = mean(w1)'

temp = zeros(3,3,10);
for i=1:10;
    temp2=w1(i,:)'-u_;
    temp(:,:,i)=temp2*temp2';
end
E_ = mean(temp,3);
E_ = (size(w1,1)-1)/size(w1,1)*E_

clear  i temp*