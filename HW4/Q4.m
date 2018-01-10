%Question 4
clear all;

%Q4 part b
x = 0.01 :0.01 : (pi/2 - 0.01);
%plot(x,F(x))
a= x - sin(x);
b = (a./sin(x))*100;
theta = x*(180/pi);

plot(theta,b)
hold on
plot(theta(53),b(53),'ok')
title("Plot of angle (theta) vs error")
xlabel("Theta (degree)")
ylabel("Error (%)")
display("Error (%) at 53rd interval")
display(b(53))
display("Angle at 53rd interval")
display(x(53)*180/pi);

% for 5% error , this value occurs at value of angle about 30 degrees. 