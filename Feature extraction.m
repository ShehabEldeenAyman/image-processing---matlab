x=imread('database_1.jpg');
y=imread('database_2.jpg');
z=imread('database_3.jpg');
x1=imread('database_4.jpg');
y1=imread('database_5.jpg');
z1=imread('database_6.jpg');
x2=imread('database_7.jpg');
y2=imread('database_8.jpg');
z2=imread('database_9.jpg');
x3=imread('database_10.jpg');
y3=imread('database_11.jpg');
z3=imread('database_12.jpg');


d1=rgb2gray(x);
d2=rgb2gray(y);
d3=rgb2gray(z);
d4=rgb2gray(x1);
t1=rgb2gray(y1);
t2=rgb2gray(z1);
t3=rgb2gray(x2);
t4=rgb2gray(y2);
t5=rgb2gray(z2);


subplot(1,2,1);
imshow(t1);
subplot(1,2,2);
imshow(d4);

fftD1=fft2(double(d1));
d1features=abs(fftD1(:));
d1features=sort(d1features,'descend');
d1features=d1features(1:3);

fftD2=fft2(double(d2));
d2features=abs(fftD2(:));
d2features=sort(d2features,'descend');
d2features=d2features(1:3);


fftD3=fft2(double(d3));
d3features=abs(fftD3(:));
d3features=sort(d3features,'descend');
d3features=d3features(1:3);

fftD4=fft2(double(d4));
d4features=abs(fftD4(:));
d4features=sort(d4features,'descend');
d4features=d4features(1:3);

fftT1=fft2(double(t1));
t1features=abs(fftT1(:));
t1features=sort(t1features,'descend');
t1features=t1features(1:3);

fftT2=fft2(double(t2));
t2features=abs(fftT2(:));
t2features=sort(t2features,'descend');
t2features=t2features(1:3);

fftT3=fft2(double(t3));
t3features=abs(fftT3(:));
t3features=sort(t3features,'descend');
t3features=t3features(1:3);

fftT4=fft2(double(t4));
t4features=abs(fftT4(:));
t4features=sort(t4features,'descend');
t4features=t4features(1:3);

fftT5=fft2(double(t5));
t5features=abs(fftT5(:));
t5features=sort(t5features,'descend');
t5features=t5features(1:3);

features=[d1features,d2features,d3features,d4features,t1features,t2features,t3features,t4features,t5features];

image=d4;

fftI=fft2(double(image));
imagefeatures=abs(fftI(:));
imagefeatures=sort(imagefeatures,'descend');
imagefeatures=imagefeatures(1:3);

for i=1:9
nearesy(i)=sqrt((imagefeatures(1)-features(1,i))^2+(imagefeatures(2)-features(2,i))^2+(imagefeatures(3)-features(3,i))^2);
end

nearesy
[MinResult,Index]=min(nearesy)