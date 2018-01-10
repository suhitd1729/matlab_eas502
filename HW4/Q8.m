%Q8
clear all;
clc
F = [-631 316 -156 144 -36;-798 400 -195 180 -45;900 -450 227 -204 51;-28 14 -7 12 -1 ;96 -48 24 -24 14;];
%% Normal
eigF = eig(F);
M=F;
disp("Using QR form")
for i=1:65
   [Q,R] = qr(M);
   M=R*Q;
end
eigF;
diag(M);
res = [eigF,diag(M)]

% took 65 iterations using QR 
% We see that the values are very close to the actual values 
%% Converting to Hessenberg
disp("Using Hessenbergs form")
FH = hess(F)
eigFH = eig(FH);
MH=FH;
for i=1:39
   [Q,R] = qr(MH);
   MH=R*Q;
end
eigFH;
diag(MH);
res = [eigFH,diag(MH)]

% took 39 iterations using by converting to Hessenberg form 
