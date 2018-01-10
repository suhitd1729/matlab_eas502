clc
clear 

%since there are 9 values in total (2 to 10)
M_cgs = cell(9, 1) ;
M_mgs = cell(9, 1) ;
M_h = cell(9, 1) ;
M_qr = cell(9,1);

for i= 2:10 
disp("order is " +i)
A = hilb(i)

[Uh,Rh] = hqrd(A)
I = eye(size(Uh));
Qh = house_apply(Uh,I)

M_h{i} = Qh;

[Qcgs Rcgs]= classical_gschmidt(A)
M_cgs{i} = Qcgs;

[Qmgs Rmgs]= modified_gschmidt(A)
M_mgs{i} = Qmgs;

[Q,R] = qr(A) %using MATLABs QR computation
M_qr{i} = Q

end
h_Norm_Matrix=[]
cgs_Norm_Matrix=[]
mgs_Norm_Matrix=[]
qr_Norm_Matrix=[]

for i = 2:10
    disp("the dimension is "+i+"x"+i)
    disp("-----")
    disp("HouseHolder Q")
    Q_h = M_h{i}
    h_norm = norm(Q_h'*Q_h - eye(i))
    disp("The norm for HouseHolder of order "+i+"x"+i+" is "+h_norm)
    h_Norm_Matrix(i) = h_norm;
    disp("Classical Gram Schmidt Q")
    Q_cgs =M_cgs{i}
    cgs_norm = norm(Q_cgs'*Q_cgs - eye(i))
    disp("The norm for Classical Gram Schmidt of order "+i+"x"+i+" is "+cgs_norm)
    cgs_Norm_Matrix(i)= cgs_norm;
    disp("Modified Gram Schmidt Q")
    Q_mgs =M_mgs{i}
    mgs_norm = norm(Q_mgs'*Q_mgs - eye(i))
    disp("The norm for modified Gram Schmidt of order "+i+"x"+i+" is "+mgs_norm)
    mgs_Norm_Matrix(i)= mgs_norm;
    disp("QR traditional Q")
    Q_qr = M_qr{i}
    Q_qr_norm = norm(Q_qr'*Q_qr - eye(i))
    disp("The norm for QR of order "+i+"x"+i+" is "+Q_qr_norm)
    qr_Norm_Matrix(i)= Q_qr_norm;
end

qr_Norm_Matrix(1) = [];
h_Norm_Matrix(1) = [];
cgs_Norm_Matrix(1) = [];
mgs_Norm_Matrix(1) = [];
title('Comparison of Norms for Various QR Decomposition Methods')
xlabel('dimension') 
ylabel('norm value')
x = linspace(2,10,9);
% plot(x,qr_Norm_Matrix)
semilogy(x,qr_Norm_Matrix)
hold on
% plot(x,h_Norm_Matrix)
% loglog(x,h_Norm_Matrix)
semilogy(x,h_Norm_Matrix)
hold on
% plot(x,cgs_Norm_Matrix)
% loglog(x,cgs_Norm_Matrix)
semilogy(x,cgs_Norm_Matrix)
hold on
% plot(x,mgs_Norm_Matrix)
% loglog(x,mgs_Norm_Matrix)
semilogy(x,mgs_Norm_Matrix)
hold on
legend('QR Norm','HouseHolder Norm','Classical GS Norm','Modified GS Norm')

%%%
%The order of error is as follows ,
% Error in Classical GS > Error in Modified GS > Error in QR computed by  MATLABs QR > Error in Householder QR  
% Image has been attached for reference.
% Q2_Comparison_of_Norms_for_various_sizes_of_Hilb_Matrix.png
