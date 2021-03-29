% function cg_test
tol=1e-6
n=100
x=zeros(n,1);
matrix='random'
matrix='1d'
p=2
maxit=1000
preconditioner='I'
switch preconditioner
    case 'I'
    P = @(x)x
otherwise
        error(['unknown preconditioner type ',preconditioner])            
end
switch matrix
    case 'random'
        A=rand(n); A=A*A'; 
        A=A+p*eye(n);
        b=rand(n,1);
    case {'1d','1d laplacian'}
        A=spdiags(ones(n,1)*[-1,p,-1],[-1,0,1],n,n);
        b=ones(n,1);
        b=sin(1:n)';
    otherwise
        error(['unknown matrix type ',matrix])            
end
P = @(x)x
[x,res]=cg_ref(@(x)A*x,b,x,tol,maxit);
[x,res]=pcg_ref(@(x)A*x,P,b,x,tol,maxit);
r=b-A*x;
res_norm=max(abs(r))
semilogy([0:length(res)-1],res)
title(['MCG matrix=',matrix,' size=',num2str(n),...
    ' parameter ',num2str(p),' preconditioner=',preconditioner])
xlabel('iterations')
ylabel('residual')
grid on
% end
