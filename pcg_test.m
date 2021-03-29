function pcg_test 
n = 1000
reg = 1e-5
pert=0.1
A = rand(n); A=A*A'+reg*eye(n);
P = rand(n); M=A+pert*P*P';
b = rand(n,1);
x = zeros(n,1);
tol = 1e-9
maxit = n+2
[xk,kk]=pcg_k(@(x)A*x,@(r)M\r,b,x,tol,maxit);
[x,res]=pcg_ref(@(x)A*x,@(r)M\r,b,x,tol,maxit);
err=norm(x-xk)
res_norm = norm(b-A*x)
condition_A=cond(A)
lambda = eig(A,M);
condition_prec = max(lambda)/min(lambda)
semilogy([0:length(res)-1],res)
title('Preconditioned conjugate gradients')
xlabel('iterations')
ylabel('residual')
end