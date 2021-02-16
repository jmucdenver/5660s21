function v=solve_gauss(A,b)
% v=solve_gauss(A,b)
% solve system A*v=b by Gaussian elimination (teaching version)
    [n,n2]=size(A);
    if n ~= n2,
        error('matrix A must be square')
    end
    pr='>'
    clc
    A0=A
    b0=b
    M=eye(n)
    input(pr);
    for i=1:n-1
        % clc
        for j=i+1:n
            M(j,i)   = A(j,i)/A(i,i)
            fprintf('subtracting %g times row %g from row %g\n',M(j,i),i,j)
            A(j,i:n) = A(j,i:n)-M(j,i)*A(i,i:n) 
            b(j)     = b(j) - M(j,i)*b(i)
            input(pr);     
        end
    end
    % back substitution
    v=zeros(n,1); % preallocate as column
    v(n)=b(n)/A(n,n)
    % input(pr);
    for i=n-1:-1:1
        M, A, b
        v(i) = (b(i) - A(i,i+1:end)*v(i+1:end))/A(i,i)
        input(pr);
    end
    err = norm(A0*v - b0,1)
    M_times_A_minus_A0 = M*A - A0
end