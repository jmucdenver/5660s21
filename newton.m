function x=newton(f,df,x0,rtol,maxit)
% newton(f,df,x0)
x = x0;
a=x;b=x;
clf
for i=0:maxit
    xold = x;
    v = f(x);
    d = df(x);
    plot([x,x],[0,v],'--')
    hold on
    fprintf('iteration %i x=%g f(x)=%g f''(x)=%g\n',...
      i,x,v,d)
    if abs(v) < rtol,
        break
    end
    pause
    x = x - v/d;
    a = min(a,x);
    b = max(b,x);
    plot([xold,x],[v,0],'o-')
    hold on
    fplot(f,[a,b]);
    grid on
    drawnow
    pause
end