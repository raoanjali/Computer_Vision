
function [U] = ComputeWarpMapping (I, O)

% xd input
% x output
xd = I(1,:);
yd = I(2,:);

x = O(1,:);
y = O (2,:);

n = size(I,2);

rowsz = zeros(3,n);
rxy = -[x; y; ones(1,n)];

hx = [rxy;rowsz;xd.*x;xd.*y;xd];
hy = [rowsz; rxy; yd.*x; yd.*y;yd];

h = [hx hy];
if n == 4
    [U, V, S] = svd(h);
else
    [U, V, S] = svd(h, 'econ');
end
V = (reshape(V(:,9), 3, 3)).';
U = (reshape(U(9,:), 3, 3)).';

end
% % % B = P;
% 
% A=zeros(16,9);
% for i=1:4
% A((2*i)-1,:)=[-x(i),-y(i),-1,0,0,0,x(i)*xd(i),xd(i)*y(i),xd(i)];
% A(2*i,:)=[0,0,0,-x(i),-y(i),-1,x(i)*yd(i),yd(i)*y(i),yd(i)];
% end
% 
% h = null(A)
% [u,s,v] = svd(A);
% h=v(:,9);
%  
% %Scaling Factor to get m9=1
% s = 1/h(9,1);
% 
% %Multiplyig by scaling factor
% h=h*s;
% 
% h = reshape(h,[3,3]);
% 
% j = zeros(3,8);
% j(1,:) = [xd];
% j(2,:) = [yd];
% 
% for i=1:8
%     j(3,i) = [1];
% end
% j;
% u=h*j;
% 
% for i=1:8
%     u(1,i)=u(1,i)/u(3,i);
%     u(2,i)=u(2,i)/u(3,i);
%     u(3,i)=u(3,i)/u(3,i);
% end
% 
% u