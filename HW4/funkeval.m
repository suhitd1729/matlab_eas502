function f = funkeval(x)
n = max(size(x));
f = zeros(n,1);
f(1) = x(1)^3 + x(2) - 1;
f(2) = x(1) - x(2) + 1;
end