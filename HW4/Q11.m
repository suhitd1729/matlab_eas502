% Q 11

clc
clear all

syms f(x) 
f(x) =  -2 + exp(-0.5*x)*(4-x);

fp = diff(f,x)
f = inline(f)
fp = inline(fp)
%% for x0 = 2
x0 = 2
[dvalue,iter] = newtons(x0,f,fp)
%value is 0.8857 in 3 iterations

%% for x0 = 6
x0 = 6
dvalue = newtons(x0,f,fp)
%value cant be found out at 6 , that is no convergence
% The reason is that there is divide by 0 situation in this case. The value
% of the derivate of the function at 6 equals to 0 which is why as can be seen in the Command window
% it is shown as XN is Inf.
%% for x0 = 8 
x0 = 8
dvalue = newtons(x0,f,fp)
%value cant be found out at 8 , again no convergence
% The reason is that there is divide by 0 situation in this case after 
% a particular iteration which is why as can be seen in the Command window
% it is shown as XN is Inf.
