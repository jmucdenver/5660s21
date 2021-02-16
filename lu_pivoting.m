function [P,L,U]=lu_pivoting(A,dopivot)
% [P,L,U]=lu_pivoting(A,dopivot)
% find lower triangular L and upper triangular U and permulation matrix P
% so that P*A=L*U, by partial pivoting
% Jan Mandel, February 2020
if ~exist('dopivot','var')
    dopivot=1;
end
    [n,n2]=size(A);
    if n ~= n2,
        error('matrix A must be square')
    end
    clc,disp('input matrix')
    A
    pr='>';
    input(pr);
    clc
    disp('Initial matrices')
    P=eye(n);
    U=A;
    L=zeros(n);
    U,L,if(dopivot),P,end
    input(pr);
    for i=1:n-1
        col=U(i:end,i);
        ii=find(abs(col)==max(abs(col)))+i-1;
        ii=ii(1); % if there are more take the first one
        if dopivot & ii~=i,
            clc, 
            fprintf('swapping rows %i and %i\n',i,ii)
            U,L,P
            input(pr);   
            clc, 
            fprintf('swapped rows %i and %i\n',i,ii)
            P=swap_rows(P,i,ii);
            U=swap_rows(U,i,ii);
            L=swap_rows(L,i,ii);
            U,L,P
            input(pr)
        else
            clc
            % fprintf('no swapping needed under U(%i,%i)\n',i,i)
            U,L,if(dopivot),P,end
            input(pr)
        end
        clc, 
        fprintf('eliminating the entries under U(%i,%i), storing multipliers\n',i,i)
        U,L,if(dopivot),P,end
        input(pr);
        for j=i+1:n
            L(j,i)   = U(j,i)/U(i,i);
            % fprintf('subtracting %g times row %g from row %g\n',L(j,i),i,j)
            U(j,i:n) = U(j,i:n)-L(j,i)*U(i,i:n);    
        end
        % clc, 
        fprintf('eliminated the entries under U(%i,%i)\n',i,i)
        U,L,if(dopivot),P,end
        input(pr)
    end
    L=L+eye(n);
    clc,disp('result')
    U,L,P
    disp('should have P*A = L*U')
    err = norm(P*A - L*U,inf)
end