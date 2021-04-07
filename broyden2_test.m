function broyden2_test
f=@(x)[x(2)^2+x(1)^2-1
       (x(1)-1)^2+x(2)^2-1]
B=eye(2)
x = [1;1];

for i=1:100
    [x,B]=broyden2(f,x,B)
end