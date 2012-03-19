% ch4_2

clear all
clc

load ch4data

Tc = zeros(1,30);
Tc(1:10)=1;
Tc(11:20)=2;
Tc(21:30)=3;

[w a]= PNN_Training(data,Tc,3);

Sample=[.5 1.0 .0 ;.31 1.51 -.50 ;-.3 .44 -.1]';


ha = 1;

[class_a]=PNN_Classification(w,a,Sample,ha)

hb=.1;
[class_b]=PNN_Classification(w,a,Sample,hb)