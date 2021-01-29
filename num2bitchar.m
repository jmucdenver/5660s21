function s=num2bitchar(a)
% s=bitstr(a)
% return string of bits in variable a
% in
%   a  numeric scalar
% out
%   char array of 0 1 characters one for each bit of a
b=num2bit(a);    % get array of 0 1
n=length(b);
f=repmat('%d',1,n);  % replicate %d to format char array
s=sprintf(f,b);  % convert to char array
end



