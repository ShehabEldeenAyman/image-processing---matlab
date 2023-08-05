A= [1 2 3 4; 11 12 13 14; 21 22 23 24]
Vector1= A (3, :)
Vector2= A (:,2)
A(4,5) = 5
A (1, :) = []
A (1, :) = 0
A(:, 1:2)= []

for x= 5:2:20
fprintf ('%d \t', x);
end
img = imread('cat.jpg');
red = img(:,:,3);
grey = rgb2gray(img);
greyImg = (1/3)*img(:,:,1)+(1/3)*img(:,:,2)+(1/3)*img(:,:,3);
pad1 = zeros(10,700);
greyImg = [zeros(10,700);greyImg;zeros(10,700)];
greyImg = [zeros(487,10),greyImg,zeros(487,10)];
imshow(greyImg)

[row, col, dim] = size(greyImg);
scale = 0.5;
new_img = uint8(zeros(floor(row*scale),floor(col*scale),dim));

r=1;c=1;

for i=1:dim
    for j=1:(1/scale):row
        for k=1:(1/scale):col
            new_img(c,r,i) = greyImg(j,k,i);
            r=r+1;
        end
        c=c+1;
        r=1;
    end
    c=1;
end

imshow(new_img)
     
            


