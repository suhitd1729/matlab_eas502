clc
A = [1 2 3;4 5 6;7 8 7;4 2 3;4 2 2]
disp("For classical Gramm Schmidt")
[Qclass,Rclass] = classical_gschmidt(A)

disp("For Modified Gramm Schmidt")
[Qmod,Rmod] = modified_gschmidt(A)

disp("For HouseHolder")
[Uhouse,Rhouse] = hqrd(A);
I = eye(size(Uhouse));
Qhouse = house_apply(Uhouse,I)
Rhouse


%%%
% The first two columns are same for the Q obtained in classical and
% modified Gram Schmidt.
% Also , the entries in the first 2 columns of the Householder Q is
% negative of the entries in the Modified Gram Schmidt. The third column in
% the Q matrix for both is the same. 
% Also the first two row entries of R in HouseHolder is the negative of the
% entries in the Modified Gram Schmidt.The 3rd row is the same for both.

disp("2Norm classical GS (Qtranspose * Q  - I)")
norm(Qclass'*Qclass -eye(3))
disp("2Norm modified GS(Qtranspose * Q  - I)")
norm(Qmod'*Qmod -eye(3))
disp("2Norm HouseHolder(Qtranspose * Q - I)")
norm(Qhouse'*Qhouse -eye(3))

%The highest norm is obtained for Classical Gram Schmidt , that is the
%Qtranspose times Q is least closer to Identity Matrix for Classical Gram Schmidt as
%compared to Modified Gram Schmidt and Householder.


