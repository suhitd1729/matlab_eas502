function [p,c] = ellipse_coeff_generator(x,y)
x = x(:);
y = y(:);
len = length(x);
%ay2 + bxy + cx + dy + e = x2
p1 = y.*y;
p2 = x.*y;
p3 = x;
p4 = y;
p5 = ones(len,1);

p = horzcat(p1,p2,p3,p4,p5);
disp(p);

q = x.*x;
disp(q)
%pc = q -> c = p\q
c = p\q
end