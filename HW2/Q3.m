%Question 3
clear
%close all
clc

A = [10.^-20 1;1 1]
%part a The condition number of A
cond(A)



b = [1 ; 0]
x = A\b

    %values obtained are -1 and 1 

