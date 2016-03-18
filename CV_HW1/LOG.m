function [ LOG ] = LOG(  )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

L = [0 1 0; 1 -4 1; 0 1 0]
G11 = Gaussian(11,1)
LOG = conv2(G11,L)

surf(LOG)

end

