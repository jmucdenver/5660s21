function [xnew,Anew]=broyden(f,x,A)
% broyden method
    err = norm(f(x))
    xnew = x - A\f(x);  % A is initial approximation to Df
    delta = xnew-x;
    Delta = f(xnew)-f(x);
    % update A from that so that Delta = A*delta
    Anew = A + (Delta - A*delta)*delta'/(delta'*delta);
end
    
