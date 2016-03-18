clc
clear

A = imread('building.bmp');
Gx = [-1 0 1; -2 0 2; -1 0 1];
Gy = [1 2 1; 0 0 0; -1 -2 -1];

Gradx = conv2(double(A),double( Gx));
Grady = conv2 (double(A),double( Gy));

Gradient = sqrt ( Gradx.* Gradx + Grady.*Grady);
imshow(Gradient);

threshold = 150;
B=max(Gradient,threshold); % All values in gradient matrix which are less than the threshold value are set equal to threshold value
B(B==round(threshold))=0; % All values in the gradient matrix which are equal to threshold value are now set as zero.
%Thus leaving only the strong edges.

B=uint8(B);
X= ~B % To make it Binary and reverse the display so as o use black for edges.
figure,imshow(X);title('Edge detection using Sobel edge detector');
