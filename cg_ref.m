function [x,res]=cg_ref(A,b,x,tol,maxit)
% x=cg_ref(A,b,tol,maxit)
% arguments:
%    A  function handle for matrix-vector multiply
%    b  right-hand side
%    x  initial solution
%    tol residual stopping tolerance in the 2-norm
%    maxit maximum number of iterations
% returns:
%    x   approximate solution of A*x=b
%    res residual history
%
% Run cg_test to test
if ~nargin, help(mfilename), return, end

r = b - A(x);
v = r;
n = r'*r;
res(1)=sqrt(n);
disp(['initial residual ',num2str(res(1))])
for it=1:maxit
    z = A(v);
    t = n/(v'*z);
    x = x + t*v;
    r = r - t*z;
    n_old=n;
    n = r'*r;
    res(it+1)=sqrt(n);
    disp(['step ',num2str(it),' residual ',num2str(res(it+1))])
    if n<tol*tol
        break
    end
    s = n/n_old;
    v = r + s*v;
end
end   