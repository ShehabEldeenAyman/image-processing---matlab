function [ y ] = imageResize( x,scale )
[rows, col, dim]=size(x);
i=1;
j=1;
y=uint8(zeros(floor(rows*scale), floor(col*scale),dim));
for p=1:dim
for k=1:(1/scale):rows
for l=1:(1/scale):col
y(i,j,p)=x(k,l,p);
j=j+1;
end
i=i+1;
j=1;
end
i=1;
end
end