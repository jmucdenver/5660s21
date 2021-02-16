function A=swap_rows(A,i,j)
% A=swap_rows(A,i,j)
% swap rows i and j in matrix A
s = A(i,:);
A(i,:)=A(j,:);
A(j,:)=s;
end