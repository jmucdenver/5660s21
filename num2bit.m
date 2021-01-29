function b=num2bit(a)
% s=num2bit(a)
% return array of bits in variable a
% in
%   a  numeric scalar
% out
%   b array one for each bit of a

if ~isnumeric(a) | ~isscalar(a)
    error('input must be numeric scalar')
end

% % this should work but for some reason the result is wrong
% p=whos('a');
% b=int32(bitget(typecast(1,'uint64'),8*p.bytes:-1:1));
% return

h=num2hex(a);
n=length(h);
b=zeros(4,n);
hex_char=['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'];
hex_bits=[             
           0   0   0   0   0   0   0   0   1   1   1   1   1   1   1   1
           0   0   0   0   1   1   1   1   0   0   0   0   1   1   1   1
           0   0   1   1   0   0   1   1   0   0   1   1   0   0   1   1
           0   1   0   1   0   1   0   1   0   1   0   1   0   1   0   1
];

for i=1:n
    ix=find(h(i)==hex_char);  % index of h(i) in hex_char from 1
    b(:,i)=hex_bits(:,ix);
end
b = b(:)';  % flatten s to row
end