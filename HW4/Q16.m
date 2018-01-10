%Q16
clc 

clear 
time_45 = 0:0.001:5;
initial_x = 4;

func = @(x,t) -700*x - 1000*exp(-t);

%using ode45
[t,x] = ode45(func,time_45,initial_x);
plot(t,x);
xlabel('t');
ylabel('x');    
title("Using ODE45")

%step size of 0.001 
%no of steps required is 5000

time_23S = 0:0.01:5;
%using ode23s
[t_23,x_23] = ode23s(func,time_23S,initial_x);
figure
plot(t_23,x_23);
xlabel('t');
ylabel('x');
title("Using ODE23S")

%step size of 0.01
%no of steps required is 500

%Almost 10 times less in ODE23S