clear all
clc
P = [0 0;1 1;0 3;1 4;3 1;4 1;4 3]'
 Tc = [1 1 2 2 3 3 3]

 
 
 [myw mya]=PNN_Training(P,Tc,3)
calss = PNN_Classification(myw,mya,P,0.1)

%newpnn
T = ind2vec(Tc);
net = newpnn(P,T);
Y = sim(net,P);
Yc = vec2ind(Y)

PNN_Classifictions(myw,mya,[1 4;0 1;5 2]')
PNN_Classification(myw,mya,[1 4;0 1;5 2]',0.1)