P =  ( imread('humanity01.jpg'));
Q = (imread('humanity02.jpg'));
R = imread('humanity03.jpg');
S = imread('humanity04.jpg');

%% Obtain features using SIFT
% Applying SIFT 
% [ pos, scale, orient, desc ] = SIFT( im, octaves, intervals, object_mask, contrast_threshold, curvature_threshold, interactive )
[ pos1, scale1, orient1, desc1 ] = SIFT( P,4, 2,0,0.03,10,2);
% octaves = 4, interval = 2, Value of sigma= 1.6, threshold = 0.03 

 %% Step 3
% Storing “reference” keypoints in a database
[database1] = add_descriptors_to_database( P , pos1, orient1, scale1, desc1 )


[ pos2, scale2, orient2, desc2 ] = SIFT( Q ,4, 2,0,0.03,10,2);

   %% Step 4
% [im_idx trans rot rho idesc inn wght] = hough( database, pos, orient, scale, desc, threshold, do_nonmax )
[im_idx ,trans, rot, rho, idesc, inn, wght] = hough( database1, pos2, orient2, scale2, desc2, 0.03,true )

%% Step 5

[M,I] = max(wght);
K = idesc {I}
G1=   database1.pos(inn{I},:);
G2=   pos2(idesc{I},:);


 
G1 = G1';
G2 = G2';

%% Step 6
B = fit_robust_affine_transform((G2),(G1));



%%
[h] = ComputeWarpMapping(I,O);

X = [];
B = [];

for i = 1:size(Q,1)
    for j =1:size(Q,2)
           
%        [x1;y1;w1] = h*[i; j; 1] ;
         F = h*[i; j; k];
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
                 D(x1,y1,z1) = Q(i,j,3);

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

    