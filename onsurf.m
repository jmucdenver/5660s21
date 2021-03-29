function onsurf(x,d,J,s)
% onsurf(x,d,J,s)
ss=linspace(s(1),s(2));
x1 = x(1)+d(1)*ss;
x2 = x(2)+d(2)*ss;
z = zeros(size(ss));
for i=1:length(ss)
    z(i)=J([x1(i);x2(i)]);
end
plot3(x1,x2,z,'k')
hold on





end