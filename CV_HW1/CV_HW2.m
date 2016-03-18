
P = imread('lena.bmp');
imshow(P)
Gx = Gaussian1dx(5,1);
R = conv2(double (P),double(Gx));
R = uint8(R);

imshow(R)

Gy = Gaussian1dy(5,1);
S = conv2(double(R),double(Gy));
S = uint8(S);

imshow(S)
