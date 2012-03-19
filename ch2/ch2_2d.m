% ch2.2(d)
clear all;
close all;
clc;

if (exist('w1')~=1) || (exist('w2')~=1)
    load ch2data.mat
end

sig_w1 = diag(var(w1(:,1:2)));
c_w1   = mean(w1(:,1:2))';
P_w1 = .5;
sig_w2 = diag(var(w2(:,1:2)));
c_w2   = mean(w2(:,1:2))';
P_w2 = .5;

% x = -100:0.1:100;
% y1 = gaussmf(x,[sig_w1, c_w1])/(sqrt(2*pi)*sig_w1);
% y2 = gaussmf(x,[sig_w2, c_w2])/(sqrt(2*pi)*sig_w2);
% plot(x,y1,'b',x,y2,'r');

% x0 = ch2_2a(sig_w1 , c_w1 , P_w1, sig_w2 , c_w2 , P_w2);

% hold on;stem(x0,[.03 .03],'fill','--');

% P_error = ch2_2b(x0,c_w1,sig_w1,c_w2,sig_w2);

% P_error_B = sqrt(P_w1*P_w2)*exp(-(1/8*(c_w2-c_w1)'*inv((sig_w1+sig_w2)./2)*(c_w2-c_w1)+0.5*log((det(sig_w1+sig_w2)./2)/sqrt(det(sig_w1)*det(sig_w2)))));


W1 = -0.5*inv(sig_w1);
w_1 = inv(sig_w1)*c_w1;
w10 = -0.5*c_w1'*inv(sig_w1)*c_w1 -0.5*log(det(sig_w1)) + log(P_w1);
W2 = -0.5*inv(sig_w2);
w_2 = inv(sig_w2)*c_w2;
w20 = -0.5*c_w2'*inv(sig_w2)*c_w2 -0.5*log(det(sig_w2)) + log(P_w2);

P_error_B = sqrt(P_w1*P_w2)*exp(-(1/8*(c_w2-c_w1)'*inv((sig_w1+sig_w2)./2)*(c_w2-c_w1)+0.5*log((det(sig_w1+sig_w2)./2)/sqrt(det(sig_w1)*det(sig_w2)))));
