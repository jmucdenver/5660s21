A=[1 -1 3
   -1 0 -2
   2 2 4]
b=[-3
    1
    0]
n=5
A=rand(n)
b=rand(n,1)

v =solve_gauss_pivoting(A,b)

% disp('as PA = LU decomposition')
% [P,L,U]=lu_pivoting(A)