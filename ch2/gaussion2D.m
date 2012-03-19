clear all
close all

load 'data.mat'
u = mean(w1(:,1:2))';
Sig = diag(var(w1(:,1:2)));

x=sym('x');
y=sym('y');
X=[x;y];
px = exp(-0.5*(X-u)'*inv(Sig)*(X-u))/(2*pi*sqrt(det(Sig)));
subplot(1,2,1);
ezmesh(px,[-10 10],[-10 10]);

u2 = mean(w2(:,1:2))';
Sig2 = diag(var(w2(:,1:2)));
px2 = exp(-0.5*(X-u2)'*inv(Sig2)*(X-u2))/(2*pi*sqrt(det(Sig2)));
hold on;
subplot(1,2,2)
ezmesh(px2,[-10 10],[-10 10]);