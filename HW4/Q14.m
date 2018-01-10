%Question 14
clc
clear all;
T= [1 20 40 60 80 100 120];
mu= [ 2.5*10.^-3 5.5*10.^-4 1*10.^-4 5*10.^-5 2*10.^-5 1.2*10.^-5 6*10.^-6  ];
% plot(T,mu);
x = 1./T;
%log mu = log a - b/T 
% let log mu = y and 1/T = x and log a = A  
% y = A - bx
% unknowns 
y = log(mu);
y = y(:);
x = x(:);
oneMat = [1;1;1;1;1;1;1];
Q = horzcat(oneMat,-x)
P = y;
% Qv = P  : v = Q\P
v = Q\P;
a = exp(v(1))
b = v(2)
% using Linear Regression (Part a)
% VALUE of a obtained is 3.5667e-05
% VALUE of b obtained is -4.3687

   
% non linear fitting 
F = @(t) a.* exp(-b*(1./T));

% mu = a*exp(b/T) 
lmu = a .* exp(-b*(1./T));


t = T;
y = mu;
F = @(x,t) x(1)*exp(-x(2)./t);
x0 = [1 8];
[x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,t,y);

semilogy(T,mu)
hold on
semilogy(T,lmu)
hold on
semilogy(t,F(x,t))
title("Variation of T vs mu in Semilog scale")
xlabel("T")
ylabel("MU")
legend("Original Function","Linear fitted Function","Non Linear fitted Function")

%% Part C
% The linear function fits the original function better than the non linear function in this
% case. 
