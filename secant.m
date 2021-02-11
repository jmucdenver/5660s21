function x=secant(f,x0,x1,rtol,maxit)
% x=secant(f,x0,x1,rtol,axit)
% example: secant(@(x)x.^2 -2,4,5,1e-10,20)
v0 = f(x0);
v1 = f(x1);
a=x0;b=x0;  % initialize display window
clf, hold off
for i=0:maxit
    d = (v1-v0)/(x1-x0);
    x2 = x1 - v1/d;
    v2 = f(x2);
    % hold on
    plot([x0,x1,x2],[v0,v1,0],'o-')
    hold on
    a = min([a,x0,x1,x2]);
    b = max([b,x0,x1,x2]);
    fplot(f,[a,b]);grid on
    drawnow
    pause
    hold on
    fprintf('iteration %i x=%g %g %g f(x)=%g %g %g d=%g\n',...
      i,x0,x1,x2,v0,v1,v2,d)
    if abs(v2) < rtol,
        break
    end
    plot([x2,x2],[0,v2],'--')
    pause
    x0=x1;
    v0=v1;
    x1=x2;
    v1=v2;
end
hold off
end