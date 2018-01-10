%Question 15

clc
clear all;

L = 1 ;
g = 9.8;

r = g/L;
%writing down the function 
f = @(t,x) [x(2); - r*sin(x(1))];

%initial cond acct to Part A of Question
init1 = [radtodeg(5);0];
%initial cond acct to Part B of Question
init2 = [radtodeg(45);0];

[t1,x1] = ode45(f,[0 10],init1);
[t2,x2] = ode45(f,[0 10],init2);

figure(1)
plot(t1,x1(:,1));
title("Solution for part A")
figure(2)
plot(t2,x2(:,1));
title("Solution for part B")