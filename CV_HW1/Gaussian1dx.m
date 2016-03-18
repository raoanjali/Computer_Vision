
function [Gx] = Gaussian1dx(w,s )
%Function to create a Gaussian kernel


%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% prompt = 'What is window size of the kernel';
% w = input (prompt);
%  prompt = 'Value of variance' ;
% s = input(prompt);

%% Creating an array of size wXw with center as zero.

[x] = meshgrid (-(w-1)/2:(w-1)/2,1)

% x2 = x.*x - Vector multiplication
f = exp( - (x.*x )/(2*s));

Gx = (1/ sqrt(2*pi)*s) * f 

% To normalize the the array 
sum1 = sum(Gx(:));
Gx = ( Gx ./sum1)

% % surf(Gx)
% colormap hsv;
% colorbar;

end

