% store u, v, in x(1), x(2)
% iterations:
maxit=50;
x=[0;0]
x_new=[0;0]
for k=1:maxit
    x_new(1) = (1/3)*(5-x(2));
    x_new(2) = (1/2)*(5-x(1));
    k, x = x_new
end
