%Question 4
clear
%close all
clc

h_vals = logspace(-1,-16,16)
x = pi/3;
%method to compute the differential at a particular value using logic
%mentioned in question
fdash_approx = (sin(x + h_vals) - sin(x))./h_vals
fexact = cos(pi/3) %will give the derivative value at pi/3 for f(x) = sin x
error = (fdash_approx - fexact).^2
error = vpa(error)
%plot between the h values and the error
loglog(h_vals,error)

minimumVal = min(error) %occurs at 10^-8



