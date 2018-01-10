clear 
clc
%Q21
%creating the function given in Q21
fun = @(x) ((1 + (x).^-2)).^0.5;

%using MATLABs integral to compute the integration
intVal = integral(fun,1,2);
disp("The actual value of the integration is " +intVal)

%using the Trapzoidal function created to evaluate the integration
trapInt = trapezoidal(1,2,7,fun);
disp("The value of the integration obtained by Trapezoidal Method is " +trapInt)
T_error = (abs(trapInt - intVal)/intVal)*100 %error is about 0.0826 %
disp("The number of intervals required was 7 for the Trapezoidal Method")

%using the Simpsons function created to evaluate the integration
simInt = simpsons(1,2,0.5,fun);
disp("The value of the integration obtained by Simpsons Method is " +simInt)
S_error = (abs(simInt - intVal)/intVal)*100  %error is about 0.1030 %
disp("The number of intervals required was " + (2-1)/0.5 + " for the Simpsons Method")
