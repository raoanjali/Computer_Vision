function [ Gy ] = Gaussian1dy( w,s )
[y] = meshgrid (-(w-1)/2:(w-1)/2,1)
[y]=[y]';
% x2 = x.*x - Vector multiplication

h = exp( - (y.*y )/(2*s));

Gy = (1/ sqrt(2*pi)*s) * h
% To normalize the the array 
sum1 = sum(Gy(:));
Gy = ( Gy ./sum1)
% sum2 = sum(Gy(:));
% Gy = ( Gy ./sum1)
% surf(Gy)
% colormap hsv;
% colorbar;


end

