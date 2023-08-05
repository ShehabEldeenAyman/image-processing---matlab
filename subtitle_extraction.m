img =imread('subtitle.png');
img = im2uint8(img);
img =rgb2gray(img);
%img = imbinarize(img);

figure(),imshow(img);
[r,c,d] = size(img);
%crop = img( 400: 637,:);
%figure(),imshow(crop);
[J,rect] = imcrop(img);
cropedimg = imcrop(img,[82,530,589,100]);
figure(),imshow(cropedimg);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
edged=edge(cropedimg,'canny');
figure(),imshow(edged);


%apply dilation to make the subtitle region
%has the largest object in the img.
dilated_img = imdilate(edged, ones(5));
figure(),imshow(dilated_img);

%extract the largest object.
largestobject = bwareafilt(dilated_img,1);
figure,imshow(largestobject), title('argest Object');

%erode with the same structing elm
%to split the subtitle from the rest of the person.
eroded_img = imerode(largestobject, ones(5));
figure,imshow(eroded_img), title("Eroded Img");


%apply connected component to extract each object
%then get bbox for each one
%itreate over bbox(s)
%and choose the one which has the max_y among them
%finaly, crop that bbox.
[L,num] = bwlabel(eroded_img);
figure,imshow(label2rgb(L)), title("Labeled Img");
struct_objects = regionprops(L,'BoundingBox');
max_y = 0;
[y, x, w, h] = deal(0);
for i=1:num
    y=uint64(struct_objects(i).BoundingBox(2))
    if y > max_y
        max_y = y;
        x=uint64(struct_objects(i).BoundingBox(1));
        w=struct_objects(i).BoundingBox(3);
        h=struct_objects(i).BoundingBox(4); 
    end
end
new_croped_img=imcrop(cropedimg,[x,max_y,w,h]);
figure,imshow(new_croped_img),title('Subtitle');


