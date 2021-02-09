disp('bisection test 2')
f=@(x)x.^3+2*x.^2-(4/3)*x-8/27
a=0
b=1
tol=1e-7
c=bisection(f,a,b,tol)
