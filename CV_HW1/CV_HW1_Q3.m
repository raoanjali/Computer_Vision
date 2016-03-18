% % Sobel edge detector
clc 
clear

% S = [-1 0 1; -2 0 2; -1 0 1];
% A = imread ('building.bmp');
% B = conv2(A,S);
% imshow (B);
% 
% a = im2single(B)
% c = imb2w
% 
% imshow (a);

A=imread('building.bmp');

B =double(A);


for i=1:size(B,1)-2
    for j=1:size(B,2)-2
        %Sobel mask for x-direction:
        Gx=((2*B(i+2,j+1)+B(i+2,j)+B(i+2,j+2))-(2*B(i,j+1)+B(i,j)+B(i,j+2)));
        %Sobel mask for y-direction:
        Gy=((2*B(i+1,j+2)+B(i,j+2)+B(i+2,j+2))-(2*B(i+1,j)+B(i,j)+B(i+2,j)));
      
        %The gradient of the image
        %B(i,j)=abs(Gx)+abs(Gy);
        B(i,j)=sqrt(Gx.^2+Gy.^2);
      
    end
end
figure,imshow(B); title('Sobel gradient');



Thresh=134;
B=max(B,Thresh);
B(B==round(Thresh))=0;

B=uint8(B);
figure,imshow(~B);title('Edge detected Image');
