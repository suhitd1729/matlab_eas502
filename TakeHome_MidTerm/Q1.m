clc
x = [1.02 ,0.95 ,0.87 ,0.77 ,0.67 ,0.56 ,0.44 ,0.3 ,0.16 ,0.01];
y = [0.39 ,0.32 ,0.27 ,0.22 ,0.18 ,0.15 ,0.13 ,0.12, 0.13 ,0.15];

[A,c] = ellipse_coeff_generator(x,y);

f = @(x,y) c(1)*y.^2 + c(2)*x.*y + c(3)*x + c(4)*y + c(5) - 1*x.^2;
fimplicit(f,[-1.5 1.5 -1.5 1.5])
hold on 
plot(x,y,'-x')
xlabel("x axis")
ylabel("y axis")
title("Elliptical orbit");
legend('elliptical region','points','location','best');

