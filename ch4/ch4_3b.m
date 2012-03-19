% ch4_3b
% kn nearest-neighbor estimation


% b.

clear all
close all
clc

load ch4data

x=w2(:,1:2)';

[X,Y]=meshgrid(-3:.02:3,0:.02:4);



k=3

[p]=kn_nearest_neighbor_estimation_2D(x,k,X,Y);
surf(X,Y,p)