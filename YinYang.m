img= imread("yin_yang.png");
figure,imshow(img);
% if the image is rgb make it grayscale
if size(img,3)==3
    secondImage=rgb2gray(img);
end
% Binarize the image and getting its inverse
BW = imbinarize(secondImage);
InvBW = ~ BW;
figure,imshow(InvBW);

%Question 1
B = bwboundaries(InvBW,'noholes');
Holes=B(1:length(B));
number_Of_Holes= length(Holes)
print(number_Of_Holes)

%Convert it to binary image
image=imbinarize(secondImage);

%Creating structring element as disk shape with radious 3
se=strel('disk',3);


%Get closed with structural element created 
closed=imclose(image,se);

%First get complement
inverted=~image;
%Get the number of pixels to check the small objects
S = regionprops(inverted, 'Area');
%Get the smallest object 
x1=min(S.Area);
%Remove smallest object (put +1 to remove objects with smaller pixels)
smallHoles=bwareaopen(inverted,x1+1);
%Invert it again to get the removed small objects
invSmall=~smallHoles;
%combine it with close 
yin=closed|invSmall;

subplot(2,3,1)
figure(1), imshow(image);
title('Original Image')
subplot(2,3,2)
figure(1), imshow(closed);
title('After Applying close morphological')
subplot(2,3,3)
figure(1), imshow(inverted);
title('Orignal complement')
subplot(2,3,4)
figure(1), imshow(smallHoles);
title('After Removing small area')
subplot(2,3,5)
figure(1), imshow(invSmall);
title('Invert of removed area')
subplot(2,3,6)
figure(1), imshow(yin);
title('Yin Shape')


% Applying open morphologcial
imgYang=imopen(image,se);
%Get inverted image
invertedYang=~imgYang;
%Fill the part that contains the shape
fill=imfill(invertedYang,'holes');
%get the intersection between opened image and filled part to get part of
%yang with black background
intersection=fill&imgYang;

%Last thing to remove white pixels that is n't relate to shape
SYang = regionprops(intersection, 'Area');
%Get the object 
x1Yang=min(SYang.Area);
%Remove  object (put +1 to remove objects with smaller pixels)
removedHoles=bwareaopen(intersection,x1Yang+1);

%Get image complement
subplot(2,3,1)
figure(2),imshow(image);
title('open morphological Image')
subplot(2,3,2)
figure(2),imshow(invertedYang);
title('inverse of orginal image')
subplot(2,3,3)
figure(2),imshow(fill);
title('After Filling holes')
subplot(2,3,4)
figure(2),imshow(intersection);
title('Intersection between opened and filling image')
subplot(2,3,5)
figure(2),imshow(removedHoles)
title('Yang Shape')

