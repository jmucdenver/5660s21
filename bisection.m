function c=bisection(f,a,b,tol)
% in:
%   f   function handle f(x)
%   a,b looking in interval [a,b]
%   tol error tolerance for solution
% out
%   c    approximation of root x in (a,b) f(x)=0
% f(a) and f(b) must have opposite signs
% Jan Mandel, February 2020

fa = f(a);  % initialize and precompute, save some evaluations
fb = f(b);
if ~ fa*fb < 0  
    error('f(a) and f(b) need to have opposite signs')
end
% now we know there is a root in (a,b)
ftol = eps*min(abs([fa,fb])); % tolerance for f(x)

% initialize

c = (a+b)/2;    % midpoint - what if the loop is never executed?
fc = f(c);      % evaluate
err = (b-a)/2;
fprintf('%2s %14s %14s %14s %11s %13s %13s %13s\n',...
        'it','endpoint a', 'midpoint c',  'endpoint b', 'max error', 'f(a)','f(c)','f(b)')
for i=0:99
    fprintf('%2i %14.9g %14.9g %14.9g %11g %13g %13g %13g\n',... % continuation line
        i,a,c,b,err,fa,fc,fb)
    % fplot(f,[a,b]);input('>')
    if err < tol,
        break
    end
    if abs(fc) < ftol, % always bad idea to test floats on equality 
        break       % lucky shortcut
    end
    if fc*fa < 0    % opposite signs at c and a?
        b=c; fb=fc; % move lower endpoint to center
    else
        a=c; fa=fc; % move upper endpoint to center
    end
    c = (a+b)/2;  % new midpoint
    fc = f(c);     
    err = (b-a)/2;
end
end