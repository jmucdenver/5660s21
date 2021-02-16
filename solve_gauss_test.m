A=[1 2 -1
    2 1 -2
    -3 1 1]
b=[3,3,-6]'
% input('press enter to continue')
x0=A\b
x=solve_gauss(A,b)