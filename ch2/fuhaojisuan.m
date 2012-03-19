
x = [x1 x2];
g1 = transpose(x)*W1*x +w_1'*x + w10;
g2 = transpose(x)*W2*x +w_2'*x + w20;
f = g1-g2;