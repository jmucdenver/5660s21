function runge
f =@(x)1./(1+10*x.*x)
for n=2:20
    xlist = linspace(-1,1,n)
    ylist = f(xlist)
    hold off
    fplot(f,[-1,1])
    hold on
    plot(xlist,ylist,'o')
    c = newtdd(xlist,ylist,n)
    xdisp = linspace(-1,1,500);
    ydisp=nest(n-1,c,xdisp,xlist);
    plot(xdisp,ydisp)
    title(['interpolation of 1/(1+10x^2) at n=',num2str(n),' equidistant points'])
    in=input('>')
end
    
    