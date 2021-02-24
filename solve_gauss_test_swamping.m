format long
disp('example 2.13')
A=[1e-20 1
   1     1]
b=[1
4]
input('>')
x=A\b
xa=solve_gauss(A,b)
disp('Forward error err=xa-x')
err=xa-x
disp('Backward error res=b-A*xa')
res=b-A*xa
input('Why? ')
disp('The second equation is swamped by the first multiplied by 1e20')
disp('The second equation gets essentially ignored')
input('Remedy: swap the equations')
disp('Before:')
A,b
disp('After:')
A=swap_rows(A,1,2)
b=swap_rows(b,1,2);
input('>')
xa=A\b
xa=solve_gauss(A,b)
disp('Forward error err=xa-x')
err=xa-x
disp('Backward error res=b-A*xa')
res=b-A*xa
