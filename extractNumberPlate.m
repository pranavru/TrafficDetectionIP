function np = extractNumberPlate(img)
    %image correlation method
    %matches 2 matrix
    load('imgRecognitionData.mat');
    
    [~,cc] = size(img);
    picture = imresize(img, [300 500]);
    
    figure;
    imshow(picture); title('Original Image');
    
    if size(picture, 3) == 3
      picture = rgb2gray(picture);
    end

    threshold = graythresh(picture);
    picture = ~im2bw(picture, threshold);
    
    figure;
    imshow(picture); title('Black and White Image');
    
    
    % Remove the patches which has less than 30 pixels
    picture = bwareaopen(picture, 30);
    
    figure;
    subplot(2,2,1);
    imshow(picture); title("Line 17 Picture: 0");


    if cc >2000
        picture1 = bwareaopen(picture, 3500);
    else
        picture1 = bwareaopen(picture, 3000);
    end
    subplot(2,2,2);
    imshow(picture1); title("Line 25 Picture: 1");
    
    % Removal of the background
    picture2 = picture -picture1;
    subplot(2,2,3);
    imshow(picture2); title("Line 29 Picture: 2");

    picture2 = bwareaopen(picture2, 200);   
    subplot(2,2,4);
    imshow(picture2); title("Line 32 Picture: 2");

    % Parameters - 
    % L: matrix which contains License plate Information 
    % Ne: number of digits or characters
    [L,Ne] = bwlabel(picture2);  


    final_output = [];
    t = [];

    for n=1 : Ne
        [r, c] = find(L == n);   
        n1 = picture( min(r):max(r), min(c):max(c));   
        n1 = imresize(n1, [42, 24]);
        x=[ ];
        
        letters = size(imgfile, 2);

        for k=1:letters
            y = corr2(imgfile{1,k},n1);
            x = [x y];
        end
        if max(x) > 0.35
            z = find( x == max(x));
            out = cell2mat(imgfile(2,z));
            final_output = [ final_output out];
        end
    end
    np = final_output;
end