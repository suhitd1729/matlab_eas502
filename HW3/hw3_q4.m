clc
clear

A = [0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,
0	1	1	0	0	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,
0	1	1	0	0	1	1	0	0	1	1	1	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,
0	1	1	0	0	1	1	0	0	1	1	1	1	1	1	0	0	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,
0	1	1	1	1	1	1	0	0	1	1	0	0	0	0	0	0	1	1	0	0	0	0	0	0	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0,
0	1	1	1	1	1	1	0	0	1	1	1	1	1	1	0	0	1	1	0	0	0	0	0	0	1	1	0	0	0	0	0	0	1	1	1	1	1	1	0,
0	1	1	0	0	1	1	0	0	1	1	1	1	1	1	0	0	1	1	0	0	0	0	0	0	1	1	0	0	0	0	0	0	1	1	1	1	1	1	0,
0	1	1	0	0	1	1	0	0	1	1	0	0	0	0	0	0	1	1	0	0	0	0	0	0	1	1	0	0	0	0	0	0	1	1	0	0	1	1	0,
0	1	1	0	0	1	1	0	0	1	1	1	1	1	1	0	0	1	1	0	0	0	0	0	0	1	1	0	0	0	0	0	0	1	1	0	0	1	1	0,
0	0	0	0	0	0	0	0	0	1	1	1	1	1	1	0	0	1	1	1	1	1	1	0	0	1	1	0	0	0	0	0	0	1	1	0	0	1	1	0,
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1	1	1	1	1	0	0	1	1	1	1	1	1	0	0	1	1	0	0	1	1	0,
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1	1	1	1	1	0	0	1	1	1	1	1	1	0,
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1	1	1	1	1	0,
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0]

figure
spy(A)

svd_h = svd(A)
figure
plot(svd_h)
title("Plot of SVD values of A Matrix");
xlabel("index");
ylabel("SVD values");
%image is saved as 'Q4_Plot_SVD_values.png' inside the folder

semilogy(svd_h)
title("Plot of SVD values of 'A' Matrix in Semilogy axis")
xlabel("index")
ylabel("svd values")
%image is saved as 'Q4_Semilogy_axis_SVD_values.png' inside the folder

r = rank(A)
disp("The rank of the matrix A is "+r)
title("Plot of SVD values of A Matrix in SemiLog Axis")

%calculation of the low rank approximation
[U Sig V] = svd(A);
for i = 1:r 
    B = U(:,1:i)*Sig(1:i,1:i)*V(:,1:i)'; 
%     Bflipped = flipud(B)
    filename = strcat('colorRank_',int2str(i),'.png');
    colormap gray
    saveas(pcolor(B),filename);
    %%%image is stored in the format colorRank_" ".png in the folder
end
