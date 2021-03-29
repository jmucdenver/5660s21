function fplot2(f,x,y)
% fplot2(f,[x1,x2],[y1,y2])
% f is a function handle called as f([x;y])
[xx,yy]=meshgrid(linspace(x(1),x(2)),linspace(y(1),y(2)));
[m,n]=size(xx);
zz=zeros(m,n);
for j=1:m
    for i=1:n
        zz(i,j)=f([xx(i,j);yy(i,j)]);
    end
end
h=surf(xx,yy,zz);
set(h,'EdgeAlpha',0,'FaceAlpha',0.1)
hold on
contour3(xx,yy,zz)
hold off
xlabel('x(1)')
ylabel('x(2)')
end