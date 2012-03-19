% ch2.2(e)
clear all;
close all;
clc;

if (exist('w1')~=1) || (exist('w2')~=1)
    load ch2data.mat
end

sig_w1 = diag(var(w1));
c_w1   = mean(w1)';
P_w1 = .5;
sig_w2 = diag(var(w2));
c_w2   = mean(w2)';
P_w2 = .5;

P_error_B = sqrt(P_w1*P_w2)*exp(-(1/8*(c_w2-c_w1)'*inv((sig_w1+sig_w2)./2)*(c_w2-c_w1)+0.5*log((det(sig_w1+sig_w2)./2)/sqrt(det(sig_w1)*det(sig_w2)))));