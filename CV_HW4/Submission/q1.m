R  = [3 4 -1];
r = R/ norm (R);

V = [0 0 1 1]';

%  Rotation Matrix
% Using Quaternions to represent the rotation

A  =75 % angle is 60 degrees
C = cosd(60)
S = sind (60)
c = 1-C
rx = r(:,1);
ry = r(:,2);
rz = r(:,3);

R = [(c*(rx)^2)+C c*rx*ry-S*rz c*rx*rz+S*ry; c*rx*ry+S*rz (c*(ry)^2)+C c*ry*rz-S*rx; c*rx*rz-S*ry c*ry*rz+S*rx (c*(rz)^2)+C]

% Translation Matrix
O = [0 0 10000]';
% Transformation Matrix
T = [R O; 0 0 0 1];

% Transformed Z axis of the cube
% lims = axis;
% % Then plot them
%  hold on
% plot3(lims(1:2),[0 0],[0 0])
% xlabel('X axis');
% ylabel('Y axis');
% zlabel('Z axis');

% plot3([0,0],lims(1:2),[0 0]) % for x-axis
% % plot3([0 0],[0 0],lims(1:2)) % for x-axis

Z  = T*V;

T1 = inv(T)
%intrinsic matrix
F = [8*200 0 2 0; 0 -8*200 3 0; 0 0 0 1];
% F = [ 200*8 0 0 0; 0 -200*8 0 0;2 3 1 1 ];
% F = [1 0 0 0 ; 0 1 0 0; 0 0 1 0; 0 0 -1/8 1];

T2 = F*T1
% Co-ordinates of he cube in the new frame of reference of the  block
p1 = [-1000 -1000 -1000 1]';
p2 = [-1000 -1000 1000 1]';
p4 = [-1000 1000 -1000 1]';
p3 = [-1000 1000 1000 1]';

p5 = [1000 -1000 -1000 1]';
p6 = [1000 -1000 1000 1]';
p8 = [1000 1000 -1000 1]';
p7 = [1000 1000 1000 1]';

n1 = (T2 *p1);
n2 = T2 *p2;
n3 = T2 *p3;
n4 = T2*p4;
n5 = T2 *p5;
n6 = T2 *p6;
n7 = T2 *p7;
n8 = T2 *p8;

N = [n1'; n2'; n3'; n4'; n5'; n6'; n7'; n8'];
hold on all
 for  i =1:8
     N1(i,1)= N (i,1)/N(i,3);
     N1(i,2)= N (i,2)/N(i,3)
 end
%   
x= N1(1:4,1);
y= N1(1:4,2); 
line(x,y) %,'*r');
% 
% % %     
% % %    P1= [x y z]';
% % %    plot3(x,y,z);
% %    
% %     if i>1
% %         line(P1,P2);
% %         
% %     end
% %     P2 = P1
% % end
%      line (x,y)
     x= N1 (5:8,1);
     y= N1 (5:8,2);
%      z= N(5:8,3);
    line(x,y)% '*g');
     
     x = [N1(4,1);N1(8,1)];
     y = [N1(4,2);N1(8,2)];
%      z = [N1(4,3);N1(8,3)];
     line(x,y);
     x = [N1(1,1);N1(5,1)];
     y = [N1(1,2);N1(5,2)];
%      z = [N1(1,3);N1(5,3)];
     line (x,y)
     x = [N1(3,1);N1(7,1)];
     y = [N1(3,2);N1(7,2)];
%      z = [N(3,3);N(7,3)];
     line(x,y);
     x = [N1(1,1);N1(4,1)];
     y = [N1(1,2);N1(4,2)];
%      z = [N(1,3);N(4,3)];
     line (x,y)
     x = [N1(5,1);N1(8,1)];
     y = [N1(5,2);N1(8,2)];
%      z = [N(5,3);N(8,3)];
     line(x,y); 
     x = [N1(6,1);N1(2,1)];
     y = [N1(6,2);N1(2,2)];
%      z = [N(6,3);N(2,3)];
     line(x,y); 