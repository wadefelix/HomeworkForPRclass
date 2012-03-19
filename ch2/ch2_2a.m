function [x0] = ch2_2a( sig_w1 , c_w1 , P_w_1, sig_w2 , c_w2 , P_w_2)

%% ch2.2(a)

E1 = sig_w1;
u1 = c_w1;


W1 = -0.5*inv(E1);
w_1 = inv(E1)*u1;
w10 = -0.5*u1'*inv(E1)*u1 -0.5*log(det(E1)) + log(P_w_1);
%g1 = x'*W1*x + w_1'*x + w10;

E2 = sig_w2;
u2 = c_w2;


W2 = -0.5*inv(E2);
w_2 = inv(E2)*u2;
w20 = -0.5*u2'*inv(E2)*u2 -0.5*log(det(E2)) + log(P_w_2);
%g2 = x'*W2*x + w_2'*x + w20;

f = [(W1-W2) w_1-w_2 w10-w20]; % f=g1-g2

x0 = roots(f);