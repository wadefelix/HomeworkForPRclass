function [ Dist ] = euclidean( x , u_i )
%% EUCLIDEAN calculate the Euclidean norm between two vectors x and u_i
%% ----------------------------------------------------------------------
%% where,
%% x is the sample vectors
%% u_i is the is the d-component mean vector
%% Dist is the Euclidean distance between x and u_i
Dist = dist(x,u_i);