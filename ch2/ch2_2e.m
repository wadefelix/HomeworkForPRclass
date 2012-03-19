clear all
close all
clc
% load 'fuhao.mat'
load 'ch2data.mat'
E1 = diag(var(w1));
u1 = mean(w1)';
P_w_1 =.5;
W1 = -0.5*inv(E1);
w_1 = inv(E1)*u1;
w10 = -0.5*u1'*inv(E1)*u1 -0.5*log(det(E1)) + log(P_w_1);

E2 = diag(var(w2));
u2 = mean(w2)';
P_w_2 =.5;
W2 = -0.5*inv(E2);
w_2 = inv(E2)*u2;
w20 = -0.5*u2'*inv(E2)*u2 -0.5*log(det(E2)) + log(P_w_2);

x1 = sym('x1');
x2 = sym('x2');
x3 = sym('x3');
x = [x1;x2;x3];

g1 = transpose(x)*W1*x +w_1'*x + w10;
g2 = transpose(x)*W2*x +w_2'*x + w20;
f = g1-g2;

% ezplot(f,[-10 10]);
% hold on;
% plot(w1(:,1),w1(:,2),'ro');
% plot(w2(:,1),w2(:,2),'b*')