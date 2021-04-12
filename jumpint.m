function runge
f =@(x)1./(1+12*x.*x)
nmax=20
equi=0 
if equi
for n=2:nmax
    xlist = linspace(-1,1,n)
    ylist = f(xlist)
    c = newtdd(xlist,ylist,n)
    hold off
    fplot(f,[-1,1])
    hold on
    plot(xlist,ylist,'o')
    xdisp = linspace(-1,1,500);
    ydisp=nest(n-1,c,xdisp,xlist);
    plot(xdisp,ydisp)
    title(['interpolation of 1/(1+12x^2) at ',num2str(n),' equidistant points'])
    pause(0.1) 
end
end
in=input('>') 
for n=2:nmax
    xlist = cos(linspace(pi/n,pi*(1-1/n),n))
    ylist = f(xlist)
    c = newtdd(xlist,ylist,n)
    hold off
    fplot(f,[-1,1])
    hold on
    plot(xlist,ylist,'o')
    xdisp = linspace(-1,1,500);
    ydisp=nest(n-1,c,xdisp,xlist);
    plot(xdisp,ydisp)
    title(['interpolation of 1/(1+12x^2) at ',num2str(n),' Chebychev nodes'])
    pause(0.1)   
end
    