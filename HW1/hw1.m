%question1
B = [4,3,7;1,2,7;2,0,4]
A = [4,7;1,2;5,6]
B*A

det(B)

E = [1,5,8;7,2,3;4,0,6]

E*B

eye(3) * B
E'
E'*E

C = [6,0,0,0;0,6,0,0;0,0,6,0;0,0,0,6]
C'
C*C'

%question2  fx=b
F =[0,4,3,4,0,0,0;0,0,0,0,0,4,5;0,0,0,0,0,1,0;0,0,5,0,0,4,0;0,0,0,5,5,3,0;0,1,0,0,1,0,0;1,0,0,0,0,0,1]
B =[0;0;50/3;0;0;0;0]
F\B 

%question4
X=[0,0,0,0,3/5,1,0,3/5;0,0,0,0,1,0,0,-1;1,0,0,1,0,0,0,4/5;0,1,0,0,0,0,0,3/5;0,0,0,1,0,0,1,0;0,0,1,0,0,1,0,0;0,0,0,0,4/5,0,1,0;0,0,0,0,3/5,0,0,0]
[LX,UX,PX] = lu(X) %using LU decomposition
BO=[0;0;0;0;0;0;0;1]
PB = PX*BO
Y = LX\PB
FORCE_4 = UX\Y %FORCE_4 is a fancy name for the final output force matrix

%question5
Q = [90,-90,0;130,-30,0;40,60,-120]
X = [0;500;-500]
Q\X

%question7
C = [1,3,0;5,-5,-6;0,-1,1]
[I7L,I7U,P] = lu(C)

%question10
A1=[0,1,1,0,1;1,1,1,0,0;0,1,0,1,0;0,0,1,0,0;1,1,0,1,0] %adjacency matrix
A2 = A1*A1
A3= A1*A1*A1
A4= A1*A1*A1*A1

%question11
P =[0,1,0,0,0;0,0,1,1,0;1,1,0,1,0;0,0,1,1,0;1,1,0,0,0]
P*P
P*P*P
P*P*P*P

%question12
M1=[1/4 ,1/3;3/4,2/3]
p = [2/3;1/3]
p1 = M1*p
p2 = M1*p1

M2 = [1/2,1/3,0;0,2/3,1/2;1/2,0,1/2]
P= [1/3;1/6;1/2]
P1 = M2*P
P2= M2*P1

M3 = [1/4 ,1/3,1/2;1/2,1/3,1/6;1/4,1/3,1/3]
pf = [1/4;1/2;1/4]
pf1 = M3*pf
pf2 = M3*pf1

%question13
M = [0.7,0.2,0.2,0.1;0.1,0.6,0.1,0.1;0.1,0.2,0.6,0.1;0.1,0,0.1,0.7]
p= [0.3;0.15;0.45;0.1]
p1 = M*p
p2 = M*p1
M100 = M^100
p100 = M100*p

%question14
syms Ex Ey Dx FAB FAC FBD FCD FDE FCE phi theta  %used to declare variables. 
% phi and theta are defined in the write up just to simplify the equations

F1 = [0,0,0,0,sin(phi),0,0,0,0;
      0,0,0,1,cos(phi),0,0,0,0;
      0,0,1,0,0,1,cos(theta),0,0;
      0,0,0,0,0,0,sin(theta),1,0;
      1,0,0,0,0,0,0,0,1;
      0,1,0,0,0,0,0,1,0;
      0,0,0,0,-cos(phi),0,cos(theta),0,1;
      0,0,0,0,sin(phi),0,sin(theta),0,0;
      0,0,0,1,0,-1,0,0,0]
  
 y=[Ex;Ey;Dx;FAB;FAC;FBD;FCD;FDE;FCE]
 
 W= [1;0;0;0;0;0;0;0;0]
 
%F1 * y = W
y = F1\W

%to plot the Forces as a function of x. Simplification to the following
%explained in the write-up
x = 0:0.2:2
Ex = -2*ones(size(x))
plot(x,Ex);
hold on 
Ey = -1*ones(size(x))
plot(x,Ey);
Dx = 2*ones(size(x))
plot(x,Dx); 
FAB = 1./(x-2)
plot(x,FAB);
FAC = (x.^2-4*x+5).^0.5
plot(x,FAC); 
FBD = x-2 
plot(x,FBD); 
FCD = -1 * ((1+x.^2).^0.5)
plot(x,FCD);
FDE = 1*ones(size(x))
plot(x,FDE); 
FCE = 2*ones(size(x))
plot(x,FCE); 
legend('Ex','Ey','Dx','FAB','FAC','FBD','FCD','FDE','FCE','Location','northeast')
title("Plot of various Force components in Q14")
xlabel('0 < x < 2') % x-axis label
ylabel('Force(in KN)') % y-axis label



