A=[1 -1 3
   -1 0 -2
   2 2 4]
b=[-3
    1
    0]

v =solve_gauss_pivoting(A,b)

% disp('as PA = LU decomposition')
% [P,L,U]=lu_pivoting(A)