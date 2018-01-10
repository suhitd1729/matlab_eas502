clc
%%%part b ii
% for the non-noise component
x = [1.02 ,0.95 ,0.87 ,0.77 ,0.67 ,0.56 ,0.44 ,0.3 ,0.16 ,0.01];
y = [0.39 ,0.32 ,0.27 ,0.22 ,0.18 ,0.15 ,0.13 ,0.12, 0.13 ,0.15];
[A1, c1] = ellipse_coeff_generator(x,y)
rank_non_noise = zeros(1,5);

for i = 1:5 
    tol = 10^(-i);
    rank_non_noise(i) = rank(A1,tol);
    disp(['Tolerance Value : ',num2str(tol),' for Rank : ',num2str(rank_non_noise(i))]);
end
%There are just 3 Rank values : 3,4,5 for the various tolerance levels from 10^-1 to 10^-5 
figure
plot(x,y,'-x') 
hold on
x = x(:);
q1 = x.*x;

  [U1 S1 V1] = svds(A1,3);
   red_A1_nn1 = U1 * S1 * V1';
   S1 
   n_n_c1= V1*((U1'*q1)./diag(S1));
   f_nn_1 = @(x,y) n_n_c1(1)*y.^2 + n_n_c1(2)*x.*y + n_n_c1(3)*x + n_n_c1(4)*y + n_n_c1(5) - 1*x.^2;
hold on 
fp_nn_rank_1 = fimplicit(f_nn_1 ,[-10.75 10.25 -10.5 10.5]);
fp_nn_rank_1.LineStyle = '--';

[U2 S2 V2] = svds(A1,4);
   red_A1_nn2 = U2 * S2 * V2';
   S2
   n_n_c2= V2*((U2'*q1)./diag(S2));
   f_nn_2 = @(x,y) n_n_c2(1)*y.^2 + n_n_c2(2)*x.*y + n_n_c2(3)*x + n_n_c2(4)*y + n_n_c2(5) - 1*x.^2;
hold on 
fp_nn_rank_2 = fimplicit(f_nn_2 ,[-10.75 10.25 -10.5 10.5]);
fp_nn_rank_2.LineStyle = ':';

[U3 S3 V3] = svds(A1,5);
   red_A1_nn3 = U3 * S3 * V3';
   S3 
   n_n_c3= V3*((U3'*q1)./diag(S3));
   f_nn_3 = @(x,y) n_n_c3(1)*y.^2 + n_n_c3(2)*x.*y + n_n_c3(3)*x + n_n_c3(4)*y + n_n_c3(5) - 1*x.^2;
hold on 
fp_nn_rank_3 = fimplicit(f_nn_3 ,[-10.75 10.25 -10.5 10.5]);
fp_nn_rank_3.LineStyle = '-';
legend('Data Points','Rank 3','Rank 4','Rank 5','location','best')
title("For Non Noisy components")
xlabel('x axis')
ylabel('y axis')
