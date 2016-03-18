clc
clear


R = imread('Lena.bmp');
G = Gaussian(11,1); %Calling Gaussian function

%% Canny Enhancer
%Smoothening by Gaussian Filter
S = conv2(double(R), double(G));
% imshow (uint8(S));
s = size (S);
% % To find the gradients in X an Y direction

% threshold in x and y direction
tx=2
ty=2

for i= 1:s-1
    for j=1:s-1
        % Gradient in X direction
        D(i,j) = S(i+1,j) - S(i,j);
        if abs(D(i,j)) > tx
            H(i,j) = 0;
        else H(i,j) = 1;
        end
        %Gradient in Y direction
        F(i,j) = S(i,j+1)-S(i,j);
             if abs(F(i,j)) > ty
            I(i,j) = 0;
        else I(i,j) = 1;
             end
            K(i,j)=sqrt((D(i,j))^2 +(F(i,j))^2);
            T(i,j) = atand (F(i,j)/ D(i,j));
           
    end
end

imshow(uint8(K));
% X = [I]+[H];
% figure,imshow(X);

%% Non Maximum suppression

% We divide the angles into 4 divisions,
% 0 to 22.5 and 0 to -22.5- = direction 0 
% % 22.5 and 67.5 to -22.5 to -67.5 = direction 
Q = [];
U = [];
%% Thresholding the image locally
for i= 1:size(K)-2
    for j=1:size(K)-2
        M = (K(i:i+2,j:j+2));
        thresh = (max(M(:))+min(M(:)))/2;
%     
         if abs(K(i,j)) > thresh
         K1(i,j) = K(i,j);
     else
         K1(i,j) = 0;
    
     end
        if abs(K(i,j)) > 8
         K1(i,j) = K(i,j);
     else
         K1(i,j) = 0;  
         end
    
    end
end
figure, imshow(uint8(K1))


for i= 1:size(K)
    for j=1:size(K)
    
        if (T(i,j) <22.5 && T(i,j)> 0 ) || T(i,j) >-22.5 &&T(i,j) <0
            Q(i,j) = 0;
        else if (T(i,j) <67.5 && T(i,j)> 22.5 )
            Q(i,j) = 45;
            else if (T(i,j) > -67.5 && T(i,j)< - 22.5 )
            Q(i,j) = -45;
                else if (T(i,j) < 90 && T(i,j)> 67.5 )
                        Q(i,j)= 90;
                    else if  (T(i,j) > -90 && T(i,j)< - 67.5 )
                            Q(i,j) = -90;
                        end
                    end
                end
            end
        end
    end
end

for i = 1: size(K1,1)-2
   for  j= 1:size(K1,2)-2
       if (Q(i+1, j+1)) == 90  || (Q(i+1, j+1)) == -90
        if K1 (i+1,j+1) > K1(i+1,j+2) && K1(i+1,j+1) > K1(i+1,j)
           
           % then set the pixel value as 1, indicating it is an edge
           U (i+1, j+1) = 1;
        else
            U(i+1, j+1) =0;
        end
       
       else if   (Q(i+1, j+1)) == -45
     if K1 (i+1,j+1) > K1(i,j) && K1(i+1,j+1) > K1(i+2,j+2)
         U (i+1, j+1) = 1;
        else
            U(i+1, j+1) =0;
     end
           
           else if  (Q(i+1, j+1)) == 0
        if K1 (i+1,j+1) > K1(i,j+1) && K1(i+1,j+1) > K1(i+2,j+1)
         K1 (i+1, j+1) = 1;
        else
            U(i+1, j+1) =0;
        end    
               
               else if (Q(i+1, j+1)) == 45
                      if K1 (i+1,j+1) > K1(i,j+2) && K1(i+1,j+1) > K1(i+2,j)
         U (i+1, j+1) = 1;
        else
            U(i+1, j+1) =0;
        end            
                   end
               end
           end
       end
   end
end
figure, imshow(U);

%%Hysteresis Thresholdin
%% We create a High valued  upper threshold (T1) and a very low valued threshold (T2)
for i= 1:size(U)-2
    for j=1:size(U)-2
        
         if abs(U(i,j)) 
         U1(i,j) = U(i,j);
     else
         U1(i,j) = 0;
    
     end
        if abs(K(i,j)) > 6
         K1(i,j) = K(i,j);
     else
         K1(i,j) = 0;  
         end
    
    end
end