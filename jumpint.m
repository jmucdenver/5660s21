function jumpint
xx=[-1 -0.1 0.1 1];
yy=[0 0  1 1];
f =@(x)interp1(xx,yy,x);
nmax=20
equi=1 
figure(1)
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
    axis([-1 1 -1.5 1.5])
    title(['interpolation at ',num2str(n),' equidistant points'])
    pause(0.1) 
end
in=input('>') 
figure(2)
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
    axis([-1 1 -1.5 1.5])
    title(['interpolation  at ',num2str(n),' Chebychev nodes'])
    pause(0.1)   
end
in=input('>') 
figure(3)
for n=2:nmax
    xlist = linspace(-1,1,n)
    ylist = f(xlist)
    hold off
    fplot(f,[-1,1])
    hold on
    plot(xlist,ylist,'o')
    xdisp = linspace(-1,1,500);
    ydisp=interp1(xlist,ylist,xdisp);
    plot(xdisp,ydisp)
    axis([-1 1 -1.5 1.5])
    title(['piecewise linear interpolation at ',num2str(n),' equidistant points'])
    pause(0.1) 
end
in=input('>') 
figure(4)
for n=2:nmax
    xlist = linspace(-1,1,n)
    ylist = f(xlist)
    hold off
    fplot(f,[-1,1])
    hold on
    plot(xlist,ylist,'o')
    xdisp = linspace(-1,1,500);
    ydisp=interp1(xlist,ylist,xdisp,'spline');
    plot(xdisp,ydisp)
    axis([-1 1 -1.5 1.5])
    title(['cubic spline interpolation at ',num2str(n),' equidistant points'])
    pause(0.1) 
end
    