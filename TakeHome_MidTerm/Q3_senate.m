clear
clc
%for the parties of the senates
sp = load("senate_parties.txt");

%for the names 
file_sn_ID = fopen('senate_names.txt');             
sn = textscan(file_sn_ID,'%s','delimiter','\n');
fclose(file_sn_ID);

%for the senate votes
sv = load("senate_votes.txt");
s = size(sv);
row = s(1);
col = s(2); 

sv_matrix = zeros(row,col);

for i = 1:row 
    new_row = sv(i,:);
    sv_matrix(i,:) = new_row;
end

%plotting the svd of the sv matrix
sv_sing_val = svd(sv_matrix)
figure
plot(sv_sing_val);   
xlabel('index');
ylabel('Singular Values');
title('Plot of Singular Values of the Matrix for Senate');

[Usv,Ssv,Vsv]= svd(sv_matrix);

%scatter plot of U1 vs U2
%100 for Democrats, 200 for Republicans, and then any other code we will label as Independent
x = Usv(:,1);
y = Usv(:,2);
i_dem = (sp == 100);       
i_rep = (sp == 200);  
i_ind = (sp ~= 100 & sp ~= 200);
x_dem = x(i_dem); 
x_rep = x(i_rep); 
y_dem = y(i_dem);
y_rep = y(i_rep); 
x_ind = x(i_ind);
y_ind = y(i_ind);

figure
scatter(x_dem, y_dem, 30, [0 0 1], 'filled');
hold on; 
scatter(x_rep, y_rep, 30, [1 0 0], 'filled');
hold on;
scatter(x_ind, y_ind, 30, [0 1 0], 'filled');
hold on;
legend('Democrat','Republican','Independent','location','best');
xlabel('first column of U Matrix')
ylabel('second column of U Matrix')
title('Distribution of Votes for Senate')

%%part e
[Ursv,Srsv,Vrsv]=svds(sv_matrix,2);
sv_red_matrix = Ursv * Srsv * Vrsv';
%the following will directly return the sign of the numbers in the same
%matrix dimension 
sv_sign_matrix = sign(sv_red_matrix); 
%this returns a logical matrix. For all the matched values return 1 else 0
sv_result_matrix = sv_sign_matrix==sv_matrix;

sv_predict_array = zeros(size(sv_result_matrix,1),1);
total = size(sv_result_matrix,2);
s_total_correct = 0;
for r = 1 : size(sv_result_matrix,1)
    counter = 0;
    for c = 1 : size(sv_result_matrix,2) 
        if sv_result_matrix(r,c) == 1
            counter = counter + 1;
            s_total_correct = s_total_correct + 1;
        end
    end
    sv_predict_array(r,1) = counter/total;
end
s_total_correct 

s_total_percent = (s_total_correct / (row * col)) * 100

figure
ux = Ursv(:,1);
scatter(sv_predict_array(i_dem),ux(i_dem),30, [0 0 1],'filled');
hold on
scatter(sv_predict_array(i_rep),ux(i_rep),30, [1 0 0],'filled');
hold on
scatter(sv_predict_array(i_ind),ux(i_ind),30, [0 1 0],'filled');

legend('Democratic','Republican','Independent','location','best')
title('Percent of Correct Matches for each Representative vs U1 for Senate')
xlabel('Percent of Correct Matches')
ylabel('U1 for Senate')