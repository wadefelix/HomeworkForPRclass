% ch4_3
% kn nearest-neighbor estimation


% a.

clear all
close all
clc

load ch4data

x=w3(:,1)';

myaxis=0.5:0.01:2.6;

k=3

[p]=kn_nearest_neighbor_estimation_1D(x,k,myaxis);
plot(myaxis,p)