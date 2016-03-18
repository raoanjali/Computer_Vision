
P = imread('lena_noise.bmp');
Q = imread('barbara_noise.bmp');
C = imread('mandrill_noise.bmp');

% imshow(P)
Gx = Gaussian1dx(5,1);
R = conv2(double (P),double(Gx));
% R = uint8(R);

T = conv2(double (Q),double(Gx));
% T = uint8(R);

D = conv2(double (C),double(Gx));
% D = uint8(D);
% imshow(R)

Gy = Gaussian1dy(5,1);

S = conv2(double(R),double(Gy));
Y=conv2(double(T),double(Gy));
Z=conv2(double(D),double(Gy));
;

% imshow(uint8(S))

A = Gaussian(5,1);
B1 = conv2(double(P),double(A));
B2 = conv2(double(Q),double(A));
B3  =conv2(double(C),double(A));

figure,imshow(uint8(S));
figure,imshow(uint8(Y));
figure,imshow(uint8(Z));

X1 = B1-S;
X2=  B2-Y;
X3 = B3-Z;