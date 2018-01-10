%Q7
clc
clear all
% the matrix given 
A = [2 1 0; 1 2 1; 0 1 2];

%created functions to run the power and the inverse power method
[maxEig, u] = DominantEigen(A, [1;1;1], 3) %0.0021132 error 
% took an initial value of [1;1;1]
[minEig, u] = SmallestEigen(A, [2;-2;2],0,3) %0.0021132 error
% took an initial value of [2;-2;2]

ratio = maxEig/minEig %ratio
disp("The Ratio of the max Eigen Value to min Eigen Value is " +ratio)
%using MATLABs condition number and eigen value finder
C = cond(A);
E = eigs(A);
E(1)
E(3)
disp("The error percent for max Eigen value is " +(abs(E(3) - maxEig)/E(3)) * 100)
disp("The error percent for min Eigen value is " +(abs(E(1) - minEig)/E(1)) * 100)

disp("The error percent for Condition number is " +(abs(C - ratio)/C) * 100)
