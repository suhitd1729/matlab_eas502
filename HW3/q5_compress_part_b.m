
function q5_compress_part_b(imgFile,r_array,outputFile)
    i = imread(imgFile);
    i = im2double(i);
%     i = double(i);
    [a b c] = size(i)
    twoD_arr1 = i(:,:,1);
    [m n] = size(twoD_arr1);
    if c~=1 
    twoD_arr2 = i(:,:,2);
    twoD_arr3 = i(:,:,3);
    end 
    M_cell = cell(length(r_array), 1); 
    for j = 1:length(r_array)  
    [U1 S1 V1] = svds(twoD_arr1,r_array(j));
    arr1 = U1*S1*V1';
    if c~=1 
    [U2 S2 V2] = svds(twoD_arr2,r_array(j));
    arr2 = U2*S2*V2';
    [U3 S3 V3] = svds(twoD_arr3,r_array(j));
    arr3 = U3*S3*V3';
    end
    
    if c ==1
    D = zeros(m,n);
    D(:,:) = arr1;
    
    elseif c ~=1 
    D = zeros(m,n,3);  % Preallocate the D Matrix
    D(:,:,1) = arr1;       
    D(:,:,2) = arr2;
    D(:,:,3) = arr3;
    end
    
    M_cell{j}= D
    end
    tot = length(r_array)
    figure 
    for k=2:tot+1    
            subplot(2,(tot+1)/2,1), imshow(imgFile)
             title('Original Image');
            subplot(2,(tot+1)/2,k);
            
           
            img = imshow(M_cell{k-1}) 
            title(['Rank= ' int2str(r_array(k-1))]);

    end
       saveas(gcf,char(outputFile),'png');

end


