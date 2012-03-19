function [ Maha ] = mahalanobis( x , u , E )
%% MAHALANOBIS calculate the mahalanobis distance between x and u
%% --------------------------------------------------------------
%% where,
%% x is is a d-component column vector
%% u is the d-component mean vector
%% E is is the d-by-d covariance matrix
%% Maha is the mahalanobis distance between x and u
y = x-u;
Maha = sqrt(y'*inv(E)*y);