function out=findeps
% out=findeps
% find machine epsilon, the smallest e such that 1+e > 1
% we know that is integer power of 2
e=1;
for i=1:100
    if ~(1+e > 1)
        break
    end
    out = e;
    e = e/2;
end
% test 
if ~( 1 + out > 1 & 1 + out/2 == 1)
    out, error('wrong result')
end
end
