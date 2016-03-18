P =  ( imread('humanity01.jpg'));
% figure, imshow(A)
% Q = 
Q = (imread('humanity02.jpg'));
R = imread('humanity03.jpg');
S = imread('humanity04.jpg');

xd = [1173 1153 843 873 755 1219 941 1079];
yd = [361 121 517 435 543 497 201 489];
x = [540 531 214 256 127  583 325 457];
y = [349 127 503 419 528 481 181 471];
O = [x;y];
I =[xd;yd];


%%
[h] = ComputeWarpMapping(I,O);

X = [];
B = [];

for i = 1:size(Q,1)
    for j =1:size(Q,2)
%            for k = 1:size(Q,3)
%        [x1;y1;w1] = h*[i; j; 1] ;
         F = h*[i; j; 1];
         x1 = (F(1,:) /F(3,:));
         y1 = (F(2,:) /F(3,:));
         z1 = (F(3,:) /F(3,:));
         x1 = floor(x1);
         y1= floor(y1);
         z1= floor(z1);    
       X(:,i,j)=[x1;y1]  ;       
        if x1 == 0 ||y1 == 0||z1==0
            x1=1;
            y1=1;
            z1=1;
        elseif x1 < 0 ||y1 < 0|| z1 < 0
            x1= abs(x);
            y1= abs(y);
            z1 = abs(z1);
        else
        end 
         
% if x1 < size(P,1) || y1 < size(P,2)
% 
%        B(x1,y1,z1) = P(i,j,k);
% else
                 D(y1,x1,z1) = Q(i,j);

       
    end
end
%%
% for i = 1:size(P,1)
%   for j = 1:size(P,2)
%      for k = 1:size(P,3)
% 
%         B(i,j,k) = P(i,j,k);
%      end
%    end
% end

A = [P D]       
figure,imshow(B);

    