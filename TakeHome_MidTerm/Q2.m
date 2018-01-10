clear
clc 
%%% part a i and ii
A = [1/3 1/3 2/3; 2/3 2/3 4/3;1/3 2/3 3/3;2/5 2/5 4/5;3/5 1/5 4/5];
r = rank(A)
m = max(size(A))*eps(norm(A))
%rank is 2

%computing the Rank using SVD 
[u s v] = svd(A)

first_sing_val =s(1);
%tol = max(size(A))*eps(max(s));
tolerance_val = 5*eps(first_sing_val)
if(s(3) > tolerance_val)
    disp("Third singular value is bigger than tolerance value")
elseif (s(3) < tolerance_val) 
    disp("Third singular value is smaller than tolerance value")
end

% using vpa, the values displayed are of increased precision 
s = vpa(s) 


%%% part a iii 
% machine eps = 2.2204e-16 
svalues = zeros(1,2000);
for k = 1 : 2000 
  svalues(k) = (0.9)^k;
end


sv_matrix = diag(svalues);
%tol = max(size(A))*eps(max(s));
tolerance = 2000 * eps(0.9);
count = 0 ;
for i = 1 : 2000 
    if(sv_matrix(i,i) > tolerance)
        count = count + 1;
    end
end

count
%the rank obtained is 276


%%%part b i 
x = [1.02 ,0.95 ,0.87 ,0.77 ,0.67 ,0.56 ,0.44 ,0.3 ,0.16 ,0.01];
y = [0.39 ,0.32 ,0.27 ,0.22 ,0.18 ,0.15 ,0.13 ,0.12, 0.13 ,0.15];

s = rng;
rng(1) 
a = -0.005;
b = 0.005;
size(x);
size(y);
r = (b-a).*rand(size(x)) + a;
x_n = x + r;
y_n = y + r;
%for non-noisy component
[A1, c1] = ellipse_coeff_generator(x,y)
c1
f1 = @(x,y) c1(1)*y.^2 + c1(2)*x.*y + c1(3)*x + c1(4)*y + c1(5) - 1*x.^2;
hold on 
fp1 = fimplicit(f1,[-0.75 1.25 -1.5 1.5]);
fp1.Color = 'r';
fp1.LineStyle = '--';
plot(x,y,'-x')
xlabel("x axis")
ylabel("y axis")
title("Elliptical orbit")
hold on
%for noisy component
[A2,c2] = ellipse_coeff_generator(x_n,y_n) 
f2 = @(x,y) c2(1)*y.^2 + c2(2)*x.*y + c2(3)*x + c2(4)*y + c2(5) - 1*x.^2;
hold on 
fp2 = fimplicit(f2,[-0.75 1.25 -1.5 1.5]);
fp2.Color = 'b';
fp2.LineStyle = '-';
plot(x_n,y_n,'-o')
legend('without noise','points(without noise)','with noise','points(with noise)','location','best');
