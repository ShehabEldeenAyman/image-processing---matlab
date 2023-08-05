
a=imread('cat2.jpg');
imgd=im2double(a);%cast to type double
x = imgd; y = imgd;
[r, c] = size(imgd);
factor = 1.2;
for i=1:r
 for j=1:c
 x(i,j)= factor*log(1+imgd(i,j));
 y(i,j)= factor*(imgd(i,j)^0.6);
 end
end

figure(1), imshow(imgd);
figure(2), imshow(x);
figure(3), imshow(y);