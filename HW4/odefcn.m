function dydt = odefcn(x1,y1)
rho = 1.3;
A = 0.039;
c = 0.05;
m = 0.43;
g = 9.81;
dydt = zeros(2,1);
dydt(1) =  (-1/(2*m))*(rho)*(A)*(c)*(sqrt((x1).^2+(y1).^2))*x1;
dydt(2) =  (-1/(2*m))*(rho)*(A)*(c)*(sqrt((x1).^2+(y1).^2))*y1-g;
end