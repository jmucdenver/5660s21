function [x,res]=pcg_ref(A,Q,b,x,tol,maxit)
% [x,res]=pcg_ref(A,Q,b,tol,maxit)
% arguments:
%    A  function handle for matrix-vector multiply
%    Q  function handle for preconditioner-vector multiply
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
z = Q(r);
d = z;
rz = r'*z;
for k=0:maxit-1
    res_norm = norm(r);
    res(k+1)=res_norm;
    disp(['iteration ',num2str(k),' norm of residual ',num2str(res_norm)])
    if res_norm<tol,return,end
    Ad = A(d);
    alpha = rz/(d'*Ad);
    x = x + alpha*d;
    r = r - alpha*Ad;
    z = Q(r);
    rz1 = r'*z;
    beta = rz1/rz;
    d = z + beta*d;
    rz = rz1;
end
end 