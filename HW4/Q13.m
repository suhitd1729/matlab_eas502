%Q 13

clc 
clear all
% created a Newton Raphson function which takes in the initial values as
% inputs as per the question 
% The function is defined in the funkeval.m file and is an input to nrndn
% function
[x,err,func] = nrndn([1,0],10.^-6,1)
[x,err,func] = nrndn([sqrt(1/3),1],10.^-6,1)

%% Part c
% When taking in the values of 1 and 0 , the function returns the value
% after a single iteration and stops. With the values provided ,the 
% Matrix is singular or close to singular after 1 iteration.

% When taking in the values of 1/root(3) and 1 , the function returns the value
% after a few iteration and stops as can be seen in the command window.









