%q3
clc 
clear
m = 50;
n = 12;
t = linspace(0,1,50);
b = cos(4 * t);
b = b(:);

A = fliplr(vander(t));
A = A(:,1:12)
size(A)
%for solving using QR:
%A = QR 
%Y = Q^T * b
% Solve Rx = Y  

%the formation and solution of the normal equations
% Compute A'A and A'b
% Cholesky(A'A)  = we get R
% Compute R'R
% R'w = A'b
% Rx = w for x
b_new = A'*b;
A_new = A'*A;
R = chol(A_new);
w = R'\b_new;
x_normal = R\w


%QR factorization using your modified Gram-Schmidt function
[Qmgs Rmgs] = modified_gschmidt(A);
Ymgs = Qmgs'*b;
x_mgs = Rmgs\Ymgs

%QR factorization using your householder reflector function
[Uh,Rh] = hqrd(A);
I = eye(size(Uh));
Qh = house_apply(Uh,I);
Yh = Qh'*b; 
disp(size(Yh));
x_h = Rh\Yh


%QR factorization using MATLAB's qr function
[Qqr,Rqr] = qr(A);
Yqr = Qqr'*b;
x_qr = Rqr\Yqr

%MATLAB's A\b 
x = A\b 

%SVD decomposition using MATLAB's svd command
%[U,S,V]=svd(A,0);
%x= V*((U'*b)./diag(S))
[U S V] = svd(A,0);
x_svd = V * ((U'*b)./diag(S))



figure()
plot(x)
hold on 
plot(x_h)
hold on 
plot(x_mgs)
hold on 
plot(x_normal)
hold on 
plot(x_qr)
hold on
plot(x_svd)
hold on
legend('Using MATLABs A and b','X-householder','X modified GS','X normal eqn','X using MATLABs QR','X using SVD')

%%%
% The solution to the least squares problem obtained is more or less the same 
% for each of the methods implemented. 
% There are minor differences, as can be seen in the image :
% Q3_comparing_sol_least_sq_prob.png attached.

