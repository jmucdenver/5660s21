function v=solve_gauss_pivoting(A,b)
% v=elimination(A,b)
% solve system A*v=b by Gaussian elimination (teaching version)
    [n,n2]=size(A);
    if n ~= n2,
        error('matrix A must be square')
    end
    pr='>'
    clc
    disp('Initial matrix and vector')
    A0=A;
    b0=b;
    A,b
    % M=eye(n)
    input(pr);
    for i=1:n-1
        % clc
        col=A(i:end,i);
        ii=find(abs(col)==max(abs(col)))+i-1;
        ii=ii(1); % if there are more take the first one
        if ii~=i,
            fprintf('swapping rows %i and %i\n',i,ii)
            A=swap_rows(A,i,ii)
            b=swap_rows(b,i,ii)
            input(pr);
        end
        for j=i+1:n
            m   = A(j,i)/A(i,i)
            fprintf('subtracting %g times row %g from row %g\n',m,i,j)
            A(j,i:n) = A(j,i:n)-m*A(i,i:n) 
            b(j)     = b(j) - m*b(i)
            input(pr);     
        end
    end
    disp('back substitution')
    input(pr);
    v=zeros(n,1); % preallocate as column
    v(n)=b(n)/A(n,n)
    for i=n:-1:1
        v, A, b
        fprintf(['solving for v(',num2str(i),')\n'])
        input(pr);
        v(i) = (b(i) - A(i,i+1:end)*v(i+1:end))/A(i,i)
        input(pr);
    end
    err = norm(A0*v - b0,1)
end