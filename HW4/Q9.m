%Q9
% for the test of convergence used an error level of within 1% 
clc
clear all
F = [-631 316 -156 144 -36;
     -798 400 -195 180 -45;
      900 -450 227 -204 51;
     -28 14 -7 12 -1;
     96 -48 24 -24 14];
sF = size(F)
eF = eigs(F)
E = [-101 51 -12 0 0;
     -174 88 -20 0 0;
     136 -68 19 0 0;
     840 -420 105 -32 18;
     2016 -1008 252 -84 46]; 
sE = size(E)
eE = eigs(E)
%for convergence within error level of within 1% 

FmaxEigen = DominantEigen(F, ones(sF(1),1),13)
% iterations required = 13
disp("Error percent for Max Eigen for F: "+ (abs(FmaxEigen - max(eF))/max(eF))*100) %0.93655

EmaxEigen = DominantEigen(E, ones(sF(1),1),6)
% iterations required = 6
disp("Error percent for Max Eigen for E: "+ (abs(EmaxEigen - max(eE))/max(eE))*100) %0.62911
