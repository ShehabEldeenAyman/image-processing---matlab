I=imread('shapes.jpeg'); 

gray=rgb2gray(I); 

bw = gray<255; 

 

eroded = imerode(bw, strel('disk', 7)); 

eroded = bwareaopen(eroded, 200); 

[L num]=bwlabel(eroded); 

 

Rhombus=zeros(size(L)); 

stats=regionprops(L ,'Perimeter','Area', 'BoundingBox'); 

circularity=[stats.Perimeter].^2./(4*pi*[stats.Area]); 

 

s=find(circularity>1.3 & circularity <1.6); 

numberofRhombus=length(s); 

for i=s 

    cropped_img = imcrop(I, stats(i).BoundingBox); 

    R=cropped_img(:,:,1); 

    NumOfPixels = numel(R); 

    pixels = find(R > thresh); 

    red=length(pixels) / NumOfPixels * 100; 

     

    G=cropped_img(:,:,2); 

    NumOfPixels = numel(G); 

    pixels = find(G > thresh); 

    green=length(pixels) / NumOfPixels * 100; 

     

    B=cropped_img(:,:,3); 

    NumOfPixels = numel(B); 

    pixels = find(B > thresh); 

    blue=length(pixels) / NumOfPixels * 100; 

     

    if (blue - red > 20 & blue - green > 20) 

        figure, imshow(cropped_img); 

    end 

end 

 