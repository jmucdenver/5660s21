disp('bisection test')
f=@(x)(x.*x+1).*x-1
f=@(x)x^3+x-1
a=0
b=1
tol=1e-20
c=bisection(f,a,b,tol)
