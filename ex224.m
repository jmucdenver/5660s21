n=6
e=ones(n,1);
a = spdiags([-e,3*e,-e],[-1,0,1],n,n);
c = flipud(speye(n))/2;
a = a+c;