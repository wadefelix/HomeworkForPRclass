function [gix] = g_i_x( x, u_i, E_i, P_w_i)
%% 正态分布判别函数,ch2.1(b)
%% Discriminant function for the Normal density
%% --------------------------------------------
%% where
%% x is the d-component vector-valued random variable with normal
%% distrbution
%% u_i is the d-component mean vector
%% E_i is the d-by-d covariance matrix
%% P_w_i is the prior probability of w_i
d = length(x);
y = x-u_i;
gix=-0.5*y'*inv(E_i)*y-0.5*d*ln(2*pi)-0.5*ln(det(E_i))+ln(P_w_i);