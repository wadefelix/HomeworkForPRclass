%
[X Y]=meshgrid(-10:0.2:10,-10:0.2:10);
Z = X .* exp(-X.^2 - Y.^2);                                        
surf(X,Y,Z)=