clear all
close all
clc

load ch3data.mat
% x1 & x2
w1_12=w1(:,1:2);

u_12 = mean(w1_12)'

temp = zeros(2,2,10);
for i=1:10;
    temp2=w1_12(i,:)'-u_12;
    temp(:,:,i)=temp2*temp2';
end
E_12 = mean(temp,3);
E_12 = (size(w1_12,1)-1)/size(w1_12,1)*E_12

% x2 & x3
w1_23=w1(:,2:3);

u_23 = mean(w1_23)'

temp = zeros(2,2,10);
for i=1:10;
    temp2=w1_23(i,:)'-u_23;
    temp(:,:,i)=temp2*temp2';
end
E_23 = mean(temp,3);
E_23 = (size(w1_23,1)-1)/size(w1_23,1)*E_23

% x1 & x3
w1_31=[w1(:,3) w1(:,1)];

u_31 = mean(w1_31)'

temp = zeros(2,2,10);
for i=1:10;
    temp2=w1_31(i,:)'-u_31;
    temp(:,:,i)=temp2*temp2';
end
E_31 = mean(temp,3);
E_31 = (size(w1_31,1)-1)/size(w1_31,1)*E_31

clear i temp* w1_*