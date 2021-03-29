function broyden_test
f=@(x)[x(2)^2+x(1)^2-1
       (x(1)-1)^2+x(2)^2-1]
B=eye(2)
x = [1;1];

for i=1:10
    [x,B]=broyden(f,x,B)
end