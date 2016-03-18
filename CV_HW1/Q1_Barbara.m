clc;
clear;
A= imread('barbara.bmp');
B = imread('barbara_noise.bmp');
G1 = Gaussian (5,1);
G2 = Gaussian (11,3);
C = conv2(double(A),double(G1));
D = conv2(double (A),double (G2));
E = conv2(double (B),double (G1));
F= conv2(double (B),double (G2));
C = uint8(C);
D = uint8(D);
E = uint8(E);
F = uint8(F);


subplot(1,3,1), imshow(B),title('Original Image')
subplot(1,3,2), imshow(E);title('Filtered with gaussian kernel(5,1)')
subplot(1,3,3), imshow(F);title('Filtered with gaussian kernel(11,3)')