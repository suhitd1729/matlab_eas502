%Question 2
clc
clear all;
% part 2a done in the pdf 
%% part 2b i
% loading data and initialising variables
data = load('theta1.dat','-mat');
dat = data.t_theta;
time = dat(1,1:20);
theta_1 = dat(2,1:20);
%initialising the variables for future use 
theta_2 = zeros(1,20); 
x_array = zeros(1,20); 
L1 =0.5;
L2 =0.75;
h=0;

%% part 2b ii
% Using Newton solver to find the value of theta2 at a particular theta1 
for i = 1:20 
t1= theta_1(i);
syms f(t2)
f(t2) = (L1.*sin(t1)-L2.*sin(t2));
dft2 = diff(f,t2);
f = inline(f);
dft2 = inline(dft2);
[x, error_est, num_iters] = newton_1d(f,dft2,1, 10^-6,50);
theta_2(i) = x;
end

% Using Newton solver to find the value of x using the values of theta2 and theta1 
for i = 1:20 
t1= theta_1(i);
t2 = theta_2(i);
syms g(x)
g(x) = x + (L1.*cos(t1)-L2.*cos(t2));
dgx = diff(g,x);
g = inline(g);
dgx = inline(dgx);
[x,error_est,num_iters] = newton_1d(g,dgx,1, 10^-6,50);
x_array(i) = x;
end


%% part 2b iii
figure(1)
plot(time,theta_1)
xlabel("Time")
ylabel("Theta1")
title("Theta1 vs Time")

figure(2)
plot(time,theta_2)
xlabel("Time")
ylabel("Theta2")
title("Theta2 vs Time")

figure(3)
plot(time,x_array)
xlabel("Time")
ylabel("Displacement(x)")
title("x vs Time")

%% part 2b iv
% creating a cubic function of x vs time
p_x = polyfit(time,x_array,3)    
% function of displacement vs time  
displacement =@(t) p_x(1).*t.^3 + p_x(2).*t.^2+p_x(3).*t+p_x(4);
figure(15) 
plot(time,displacement(time))
title("x vs Time")
xlabel("Time")
ylabel("Displacement(x)")


% applying forward,backward,central difference to compute the velocity
% dividing the intervals between 0 and 1
t=linspace(0,1,100);
h = t(2)-t(1);
vxCentral=t(2:end-1);
vdFCentral=(displacement(t(3:end))-displacement(t(1:end-2)))/(2*h);
vxForward=t(1:end-1);
vdFForward=(displacement(t(2:end))-displacement(t(1:end-1)))/h;
vxBackward=t(2:end);
vdFBackward=(displacement(t(2:end))-displacement(t(1:end-1)))/h;
figure(4)
plot(vxCentral,vdFCentral,'r')
hold on
plot(vxForward,vdFForward,'k');
hold on
plot(vxBackward,vdFBackward,'g');
title("Plots of Velocity vs Time")
xlabel("Time")
ylabel("Velocity")
legend('Vel using Central Diff','Vel using Forward Diff','Vel using Backward Diff')

% applying forward,backward,central difference to compute the acceleration
velocity =@(t) 3*p_x(1).*t.^2 + 2*p_x(2).*t +p_x(3);
axCentral=t(2:end-1);
adFCentral=(velocity(t(3:end))-velocity(t(1:end-2)))/(2*h);
axForward=t(1:end-1);
adFForward=(velocity(t(2:end))-velocity(t(1:end-1)))/h;
axBackward=t(2:end);
adFBackward=(velocity(t(2:end))-velocity(t(1:end-1)))/h;
figure(5)
%plot(t,velocity(t),'b')
plot(axCentral,adFCentral,'r')
hold on
plot(axForward,adFForward,'k');
hold on
plot(axBackward,adFBackward,'g');
title("Plots of Acceleration vs Time")
xlabel("Time")
ylabel("Acceleration")
legend('Acc using Central Diff','Acc using Forward Diff','Acc using Backward Diff')

%% part 2b v
acceleration =@(t) 6*p_x(1).*t + 2*p_x(2);
mass = 10;
Force = mass * acceleration(time);
figure(6)
plot(x_array,Force)
xlabel("Distance")
ylabel("Force")
title("Force vs Distance") 

%% part 2b vi
Work_done = trapz(x_array,Force)
disp("Work Done is " + Work_done +" units");


%% part 2c
% theta_1*t + c2*theta_1 = c1*t
% theta_1*t = c1*t - c2*theta_1
% c1*t - c2*theta_1 = theta_1*t
% [t -theta_1][c1 = [theta1.*t]
%              c2] 
% obtaining the value of coefficients by Linear Regression
theta_1 = theta_1(:);
t = time;
t = t(:);
P = [t -1*theta_1];
Q = theta_1.*t;
%Pc = Q -> c = P\Q
c = P\Q

figure(7)
plot(t,theta_1);
hold on;
c1 = c(1);
c2 = c(2);
Theta_1_func = @(t)c1*t/(t+c2);
%this is the function obtained 
plot(t,Theta_1_func(t));
xlabel("Time")
ylabel("Theta1")
legend("Actual Curve","Fitted Curve")
title("Theta1 vs Time")


%% 2d part
% repeating the same set of steps
for i = 1:20
f_theta1_arr(i) = Theta_1_func(time(i));
end 

% Using Newton solver to find the value of theta2 at a particular theta1 
for i = 1:20 
t1= f_theta1_arr(i);
syms f(t2)
f(t2) = (L1.*sin(t1)-L2.*sin(t2));
dft2 = diff(f,t2);
f = inline(f);
dft2 = inline(dft2);
[x, error_est, num_iters] = newton_1d(f,dft2,1, 10^-6,50);
f_theta2_arr(i) = x;
end
% Using Newton solver to find the value of x using the values of theta2 and theta1 
for i = 1:20 
t1= f_theta1_arr(i);
t2 = f_theta2_arr(i);
syms g(x)
g(x) = x + (L1.*cos(t1)-L2.*cos(t2));
dgx = diff(g,x);
g = inline(g);
dgx = inline(dgx);
[x,error_est, num_iters] = newton_1d(g,dgx,1, 10^-6,50);
f_x_arr(i) = x;
end
figure(8) 
plot(time,f_theta1_arr)
title('Fitted Theta1 vs Time')
xlabel("Time")
ylabel("Fitted Theta1")

figure(9)
plot(time,f_theta2_arr)
title('Fitted Theta2 vs Time')
xlabel("Time")
ylabel("Fitted Theta2")

figure(10)
plot(time,f_x_arr)
title('Fitted X vs Time')
xlabel("Time")
ylabel("Fitted X")

% computing velocity and acceleration
fitted_p_x = polyfit(time,f_x_arr,3)    
 
fitted_displacement =@(t) fitted_p_x(1).*t.^3 + fitted_p_x(2).*t.^2+fitted_p_x(3).*t+fitted_p_x(4);
%plot(time,fitted_displacement(time))

t=linspace(0,1,100);
h = t(2)-t(1);
f_vxCentral=t(2:end-1);
f_vdFCentral=(fitted_displacement(t(3:end))-fitted_displacement(t(1:end-2)))/(2*h);
f_vxForward=t(1:end-1);
f_vdFForward=(fitted_displacement(t(2:end))-fitted_displacement(t(1:end-1)))/h;
f_vxBackward=t(2:end);
f_vdFBackward=(fitted_displacement(t(2:end))-fitted_displacement(t(1:end-1)))/h;

% plot(t,velocity(t));
% hold on
figure(11) 
plot(f_vxCentral,f_vdFCentral,'r')
hold on
plot(f_vxForward,f_vdFForward,'k');
hold on
plot(f_vxBackward,f_vdFBackward,'g');
title("Plots of Fitted Velocity vs Time")
xlabel("Time")
ylabel("fitted Velocity")
legend('fitted Vel using Central Diff','fitted Vel using Forward Diff','fitted Vel using Backward Diff')

fitted_velocity =@(t) 3*fitted_p_x(1).*t.^2 + 2*fitted_p_x(2).*t +fitted_p_x(3);

f_axCentral=t(2:end-1);
f_adFCentral=(fitted_velocity(t(3:end))-fitted_velocity(t(1:end-2)))/(2*h);
f_axForward=t(1:end-1);
f_adFForward=(fitted_velocity(t(2:end))-fitted_velocity(t(1:end-1)))/h;
f_axBackward=t(2:end);
f_adFBackward=(fitted_velocity(t(2:end))-fitted_velocity(t(1:end-1)))/h;

figure(12)
plot(f_axCentral,f_adFCentral,'r')
hold on
plot(f_axForward,f_adFForward,'k');
hold on
plot(f_axBackward,f_adFBackward,'g');
title("Plots of Fitted Acc vs Time")
xlabel("Time")
ylabel("fitted Acc")
legend('fitted Acc using Central Diff','fitted Acc using Forward Diff','fitted Acc using Backward Diff')

fitted_acceleration =@(t) 6*fitted_p_x(1).*t + 2*fitted_p_x(2);

mass = 10;
fitted_Force = mass * fitted_acceleration(time);
figure(13)
plot(f_x_arr,fitted_Force)
title("fitted Force vs fitted Distance") 
xlabel("Distance")
ylabel("Force")

fitted_Work_done = trapz(f_x_arr,fitted_Force)
disp("Work done is in the case of fitted Theta1 function " + fitted_Work_done + " units");