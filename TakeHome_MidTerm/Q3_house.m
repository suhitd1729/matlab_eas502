clear
clc 
%for the parties of the house
hp = load("house_parties.txt");

%for the names 
file_hn_ID = fopen('house_names.txt');             
hn = textscan(file_hn_ID,'%s','delimiter','\n');
fclose(file_hn_ID);

%for the house votes
hv = load("house_votes.txt");
h = size(hv);
rowh = h(1);
colh = h(2); 

hv_matrix = zeros(rowh,colh);

for i = 1:rowh 
    new_rowh = hv(i,:);
    hv_matrix(i,:) = new_rowh;
end

%plotting the svd of the hv matrix
hv_sing_val = svd(hv_matrix);
figure
plot(hv_sing_val);   
xlabel('index');
ylabel('Singular Values');
title('Plot of Singular Values of the Matrix for House');

[Uhv,Shv,Vhv]= svd(hv_matrix);

%scatter plot of U1 vs U2
%100 for Democrats, 200 for Republicans, and then any other code we will label as Independent
x = Uhv(:,1);
y = Uhv(:,2);
i_dem = (hp == 100);       
i_rep = (hp == 200);  
i_ind = (hp ~= 100 & hp ~= 200);
x_dem = x(i_dem); 
x_rep = x(i_rep); 
y_dem = y(i_dem);
y_rep = y(i_rep); 
x_ind = x(i_ind);
y_ind = y(i_ind);

figure
scatter(x_dem, y_dem, 20, [0 0 1], 'filled');
hold on; 
scatter(x_rep, y_rep, 20, [1 0 0], 'filled');
hold on;
% scatter(x_ind, y_ind, 20, [0 1 0], 'filled');
% hold on;
legend('Democrat','Republican','location','best');
xlabel('first column of U Matrix')
ylabel('second column of U Matrix')
title('Distribution of Votes for House')

%%part e
[Urhv,Srhv,Vrhv]=svds(hv_matrix,2);
hv_red_matrix = Urhv * Srhv * Vrhv';
%the following will directly return the sign of the numbers in the same
%matrix dimension 
hv_sign_matrix = sign(hv_red_matrix); 
%this returns a logical matrix. For all the matched values return 1 else 0
hv_result_matrix = hv_sign_matrix==hv_matrix;

hv_predict_array = zeros(size(hv_result_matrix,1),1);
total = size(hv_result_matrix,2);
h_total_correct = 0;
for r = 1 : size(hv_result_matrix,1)
    counterh = 0;
    for c = 1 : size(hv_result_matrix,2) 
        if hv_result_matrix(r,c) == 1
            counterh = counterh + 1;
            h_total_correct = h_total_correct + 1;
        end
    end
    hv_predict_array(r,1) = counterh/total;
end

h_total_correct
h_total_percent = (h_total_correct / (rowh * colh)) * 100

figure
ux = Urhv(:,1);
scatter(hv_predict_array(i_dem),ux(i_dem),30, [0 0 1],'filled');
hold on
scatter(hv_predict_array(i_rep),ux(i_rep),30, [1 0 0],'filled');
% hold on
% scatter(hv_predict_array(i_ind),ux(i_ind),100, [0 1 0],'filled');
legend('Democrat','Republican','location','best')
title('Percent of Correct Matches for each Representative vs U1 for House')
xlabel('Percent of Correct Matches')
ylabel('U1 for House')
