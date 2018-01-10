% Q10
clc
clear all
syms f(x)
f(x) = sin(x) - x.^3;
disp("Using Bisection")
bRoots = bisect(inline(f(x)),0.5,1,10.^-6)


eq1Diff = inline(diff((f(x)),x))

disp("Using Newtons method")
[x niter] = newtons(1,inline(f),eq1Diff)

disp("Using Regula Falsi")
falsiroots = regulafalsi(inline(f),0.5,1,10.^-6)