%%%part b ii
% for the non-noise component
x = [1.02 ,0.95 ,0.87 ,0.77 ,0.67 ,0.56 ,0.44 ,0.3 ,0.16 ,0.01];
y = [0.39 ,0.32 ,0.27 ,0.22 ,0.18 ,0.15 ,0.13 ,0.12, 0.13 ,0.15];
[A1, c1] = ellipse_coeff_generator(x,y)
rank_non_noise = zeros(1,5);
for i = 1:5 
    tol = 10^(-i);
    rank_non_noise(i) = rank(A1,tol);
end
figure
plot(x,y,'-x')
hold on 
plot(x_n,y_n,'-x')
xlabel("x axis")
ylabel("y axis")
hold on 
title("Comparing both Noise and Non-Noisy components")
hold on
x = x(:);
q1 = x.*x;
% for j = rank_non_noise 
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

%%%part b ii
% for the noise component

x = [1.02 ,0.95 ,0.87 ,0.77 ,0.67 ,0.56 ,0.44 ,0.3 ,0.16 ,0.01];
y = [0.39 ,0.32 ,0.27 ,0.22 ,0.18 ,0.15 ,0.13 ,0.12, 0.13 ,0.15];

 
s = rng;
rng(1) 
a = -0.005;
b = 0.005;
size(x)
size(y)
r = (b-a).*rand(size(x)) + a;
x_n = x + r;
y_n = y + r;

[A2,c2] = ellipse_coeff_generator(x_n,y_n)



% rank_noise = zeros(1,5);
% for i = 1:5 
%     tol = 10^(-i);
%     rank_noise(i) = rank(A2,tol);
% end
% rank_noise
hold on
x_n = x_n(:);
q1 = x_n.*x_n;
 
  [U1 S1 V1] = svds(A2,3);
   red_A2_n1 = U1 * S1 * V1';
   S1 
   n_c1= V1*((U1'*q1)./diag(S1));
   f_n_1 = @(x,y) n_c1(1)*y.^2 + n_c1(2)*x.*y + n_c1(3)*x + n_c1(4)*y + n_c1(5) - 1*x.^2;
hold on 
fp_n_rank_1 = fimplicit(f_n_1 ,[-10.75 10.25 -10.5 10.5]);
fp_n_rank_1.LineStyle = '--';

[U2 S2 V2] = svds(A2,4);
   red_A2_n2 = U2 * S2 * V2';
   S2
   n_c2= V2*((U2'*q1)./diag(S2));
   f_n_2 = @(x,y) n_c2(1)*y.^2 + n_c2(2)*x.*y + n_c2(3)*x + n_c2(4)*y + n_c2(5) - 1*x.^2;
hold on 
fp_n_rank_2 = fimplicit(f_n_2 ,[-10.75 10.25 -10.5 10.5]);
fp_n_rank_2.LineStyle = ':';

[U3 S3 V3] = svds(A2,5);
   red_A2_n3 = U3 * S3 * V3';
   S3 
   n_c3= V3*((U3'*q1)./diag(S3));
   f_n_3 = @(x,y) n_c3(1)*y.^2 + n_c3(2)*x.*y + n_c3(3)*x + n_c3(4)*y + n_c3(5) - 1*x.^2;
hold on 
fp_n_rank_3 = fimplicit(f_n_3 ,[-10.75 10.25 -10.5 10.5]);
fp_n_rank_3.LineStyle = '-';
legend('Actual Data Points','Noisy Data Points','non noise Rank 3','non noise Rank 4','non noise Rank 5','noise Rank 3','noise Rank 4','noise Rank 5','location','best')


