function y=pol(c,x)
% y=pol(c,x)
% evaluate polynomial with coefficients c at x
% y = c(1) + c(2)*x + ... + c(n) x^(n-1)
% in:
%       c 1D array, coefficients of polynomial
%       x scalar, where evaluated
if ~isvector(c),
   error('c must be vector')
end
n=length(c);
% c(1) + c(2)*x + ... + c(n) x^(n-1) 
% example for n=3:
% c(1) + x*(c(2) + x*c(3))
% ....
y = c(n);
for k=n:-1:2
    y = c(k-1)+x.*y;
end
end
