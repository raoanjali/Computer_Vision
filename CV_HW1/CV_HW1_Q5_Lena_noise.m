% Program for Q_5
% We use the Laplacian of Gaussian filter first
% This we have programmed in Q_4

clear
clc
A = imread('Lena.bmp')
LOG = LOG();
C = conv2(double(A),double(LOG));
% C= uint8 (C);
% imshow(C);
% D =uint8(C);
D = C;
% figure,imshow(D); 
d = 15

E = [];
M= []
S = size(D);'

for i = 1: S(1,1)-2
   for  j= 1:S(1,2) -2
   %1%
   neg =0; 
   pos = 0;
   if sign(D(i+1, j+1)) == sign (D(i, j))
        pos = pos+1;
        
%       E (i, j ) = D (i, j)
        
   else
        if abs((D(i+1, j+1))-D(i, j)) > d       
            neg = neg+1;
        else
            pos=pos+1;
        end
   end
   
   %2       
   if sign(D(i+1, j+1)) == sign (D(i, j+1))
%           E (i, j ) = D (i, j)
              else
%       M (i,j) = D(i+1, j)-D(i, j);
       if abs(D(i+1, j+1))-(D(i, j+1))> d        
            neg = neg+1;
        else
            pos=pos+1;
       end
      end
   %3   
    if sign(D(i+1, j+1)) == sign (D(i, j+2))
        pos = pos+1;
        
%         E (i, j ) = D (i, j)
        
    else
         if abs((D(i+1, j+1)-D(i, j+2)))> d       
            neg = neg+1;
        else
            pos=pos+1;
   
      end
    end
     %4
     if sign(D(i+1, j+1)) == sign (D(i+1, j))
        pos = pos+1;
        
%         E (i, j ) = D (i, j)
        
    else
    if abs((D(i+1, j+1)- D(i+1, j)))> d       
            neg = neg+1;
        else
            pos=pos+1;
      end
     end
      %5
     if sign(D(i+1, j+1)) == sign (D(i+1, j+2))
        pos = pos+1;
        
%         E (i, j ) = D (i, j)
        
    else
     if (D(i+1, j+1)-D(i+1, j+2))> d        
            neg = neg+1;
        else
            pos=pos+1;
      end
     end
      %6
     if sign(D(i+1, j+1)) == sign (D(i+2, j))
        pos = pos+1;
        
%         E (i, j ) = D (i, j)
        
    else
     if (D(i+1, j+1)-D(i+2, j))> d        
            neg = neg+1;
        else
            pos=pos+1;
      end
      
     end
      %7
     if sign(D(i+1, j+1)) == sign (D(i+2, j+1))
        pos = pos+1;
        
%         E (i, j ) = D (i, j)
        
    else
     if (D(i+1, j+1)-D(i+2, j+1))> d        
            neg = neg+1;
        else
            pos=pos+1;
      end
      
     end
      %8
     if sign(D(i+1, j+1)) == sign (D(i+2, j+2))
        pos = pos+1;
        
%         E (i, j ) = D (i, j)
        
    else
    if abs((D(i+1, j+1)-D(i+2, j+2)))> d        
            neg = neg+1;
        else
            pos=pos+1;
      end
      
    end
      
    if neg > pos
        E(i+1,j+1) = 1;
    else
     E(i+1,j+1) = 0;
    end
        
   end
end



imshow (E)
