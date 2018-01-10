%Q5 : Two custom functions have been created q5_compress_part_a , q5_compress_part_b

warning('off','last')

% Q5 part a

%%% checking for a single rank and a single image 
q5_compress_part_a('UB.png',3)
% image is available as 'Q5_parta_ub_single_image.png' in the folder.
q5_compress_part_a('futurama.png',5)
% image is available as 'Q5_parta_futurama_rank5_single_image.png' in the folder.
q5_compress_part_a('square.png',3)
% image is available as 'Q5_parta_square_single_rank3_image.png' in the folder.

% Q5 part b

% the first parameter is the input image file, the second is the array of
% ranks(takes in odd number of ranks in the array): here it is n : 
% Total n+1 images will be displayed in subplot : 1 for the original and the
% remaining n ,the third is the name of the file of the output image

r_array1 = [1,2,5,11,20];
r_array1 = r_array1(:);    
q5_compress_part_b('UB.png',r_array1,'output_UB')
% image is available as 'output_UB.png' in the folder.

r_array2 = [1,10,50,100,200];
r_array2 = r_array2(:);    
q5_compress_part_b('futurama.png',r_array2,'futurama_reduced')
%image is available as 'futurama_reduced.png' in the folder.

r_array = [1,5,11,16,20];
q5_compress_part_b('square.png',r_array,'output_Sqr')
%image is available as 'output_Sqr' in the folder.

%%%

% The higher the rank , the better the quality of the image becomes. 
% For the UB image , rank 20 seems like a good approximation.
% For the Futurama image , rank 100 seems like a good approximation.
% For the Square image , rank 5 seems like a good approximation.
% My reasoning is based on the fact that the low ranked approximate image 
% denotes the features denoted in the original image aptly. 