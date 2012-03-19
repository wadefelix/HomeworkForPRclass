function [x] = randn_dc( u , E )
%% 随机样本生成函数,ch2.1(a)
%% RANDN_DC generate a d-component column vector
%%  ---------------------------------------------
%% u is the d-component mean vector
%% E is the d-by-d covariance matrix
%% x is a d-component column vector with mean of u and covariance of E
x = u + sqrt(diag(E)).*randn(size(u));
