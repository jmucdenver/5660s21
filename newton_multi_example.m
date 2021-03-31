f=@(x)[x(2)-x(1)^3
       x(1)^2+x(2)^2-1]
df=@(x)[-3*x(1)^2, 1
        2*x(1),  2*x(2)]
x=[1;2]
for i=1:10
   s = - df(x)\f(x); % increment
   x=x + s;
   x'
end