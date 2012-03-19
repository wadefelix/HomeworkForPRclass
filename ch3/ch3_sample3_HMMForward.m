% Sample 3
% Page 109
clear all
clc
load Sample3.mat

w0=1+1;
%p=HMM_Forward(aij,bjk,VT,w0)
p=HMM_Backward(aij,bjk,VT,w0)