% explanation of steepest descent
% copy the lines one by one to the command window
hold off, clf
A=[10,-1;-1,1]
b=[1;1]
% b=rand(2,1);
x=[0;0]
is_cg=1;

J=@(x)0.5*x'*A*x-x'*b
fplot2(J,[-2,2],[-2,4]),axis('equal'),hold on
for it=1:10
obj=J(x)
hold on;pplot3(x(1),x(2),J(x))
r=b-A*x
d=r
if is_cg
    if it>1
        d = r - d_old*(r'*A*d_old)/(d_old'*A*d_old)
    end
end
d_old=d
onsurf(x,d,J,[-1.1,1.1])
t = (r'*d)/(d'*A*d)
x = x+t*d
end