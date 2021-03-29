function [x,k]=pcg_k(A,Q,b,x,tol,maxit)
% [x,k]=pgc(A,Q,b,x,tol,maxit)
% following the book
% vectors at k have no suffix, vectors at k+1 have suffix 1
r = b - A(x);
z = Q(r);
d = z;
for k=0:maxit-1
    res = norm(r);
    disp(['iteration ',num2str(k),' norm of residual ',num2str(norm(res))])
    if res<tol,return,end
    Ad = A(d);
    alpha = (r'*z)/(d'*Ad);
    x1 = x + alpha*d;
    r1 = r - alpha*Ad;
    z1 = Q(r1);
    beta = (r1'*z1)/(r'*z);
    d1 = z1 + beta*d;
    % next
    d = d1;
    z = z1;
    x = x1;
    r = r1;
end
end   