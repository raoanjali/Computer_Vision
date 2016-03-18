
function [G ] = Gaussian(w,s)
%Function to create a Gaussian kernel
%We take user input for W and S

% prompt = 'What is window size of the kernel';
% w = input (prompt);
% 
% prompt = 'Value of variance' ;
% s = input(prompt);

if mod(w,2)== 0 
    prompt = ('Please input odd value for w')
    w= input(prompt); 

end
%% Creating an array of size wXw with center as zero.

[x y] = meshgrid (-(w-1)/2:(w-1)/2, -(w-1)/2:(w-1)/2)

% x2 = x.*x - Vector multiplication
f = exp( - (x.*x +y.*y)/(2*s));
G = (1/ 2*pi*s) * f 
% To normalize the the array 
sum1 = sum(G(:));
G = ( G ./sum1)

% % surf(G)
% colormap hsv;
% colorbar;

end

