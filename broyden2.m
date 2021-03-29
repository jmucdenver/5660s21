function [xnew,Bnew]=broyden2(f,x,B)
% update approximation B of inv(A)
    err = norm(f(x))
    xnew = x - B*f(x);
    delta = xnew-x;
    Delta = f(xnew)-f(x);
    % update B so that delta = B*Delta
    Bnew = B + (delta - B*Delta)*delta'*B/(delta'*B*Delta);
end