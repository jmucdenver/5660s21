newton(@(x)x.^3-2,@(x)3*x.^2,2,1e-10,10)
newton(@(x)x.^3,@(x)3*x.^2,2,1e-10,10)
newton(@(x)cos(x)-x,@(x)-sin(x)-1,0.1,1e-10,10)
newton(@(x)cos(x),@(x)-sin(x),0.1,1e-10,10)
