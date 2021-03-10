% store u, v, in x(1), x(2)
% iterations on
% 3*u + v = 5
% u + 2*v = 5
A=[3 1
   1 2]
A=[1 2
   3 1]
b=[5
   5]
% solving A*x=b
D = diag(diag(A))

maxit=50;
x=[0;0]
xnew=[0;0]
Di = diag(1./diag(A))
for k=1:maxit
    % x_new(1) = (1/3)*(5-x(2));
    % x_new(2) = (1/2)*(5-x(1));
    xnew = x - Di*(A*x - b)
    % rather 
    k, x = xnew
end
