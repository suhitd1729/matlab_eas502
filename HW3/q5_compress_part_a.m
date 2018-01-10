
function img = q5_compress_part_a(imgFile,r)
    i = imread(imgFile);
    i = im2double(i);
    [a b c] = size(i)
    
    twoD_arr1 = i(:,:,1);
    [m n] = size(twoD_arr1);
    
    if c~=1 
    twoD_arr2 = i(:,:,2);
    twoD_arr3 = i(:,:,3);
    end
    
    [U1 S1 V1] = svds(twoD_arr1,r);
    arr1 = U1*S1*V1';
    
    if c~=1 
    [U2 S2 V2] = svds(twoD_arr2,r);
    arr2 = U2*S2*V2';
    [U3 S3 V3] = svds(twoD_arr3,r);
    arr3 = U3*S3*V3';
    end
    
    if c ==1
    D = zeros(m,n); % Preallocate the D Matrix
    D(:,:) = arr1;
    
    elseif c ~=1 
    D = zeros(m,n,3);  
    D(:,:,1) = arr1;       
    D(:,:,2) = arr2;
    D(:,:,3) = arr3;
    end
    
    img = imshow(D)
end



