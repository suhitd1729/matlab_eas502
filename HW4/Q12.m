%Q12

% h = 97 and L = 100
h = 97;
L = 100;

syms f(a) 
f(a) =  (100/(2*a)) - sinh(97/(2*a)) 

fp = diff(f,a)
f = inline(f);
fp = inline(fp);
% x0 = 5
x0 = 5;
a = newtons(x0,f,fp)

x = -h/2 : h/2;
y = a*cosh(x/a);
plot(x,y)
xlabel("x")
ylabel("y")
title("Catenary problem solution")