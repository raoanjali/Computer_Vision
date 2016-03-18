
function [] = Ans5()
syms b c d e f g theta1 theta2 theta3
%Using the publish function does not allow any inputs from the user
%Thus, all known values have been entered as shown below. 
%The only unknown is theta

%ds is used instead of d in the DH Parameters 
%This is because d is a variable in the model

ds = [(b+d) 0 0 0 g];
alpha = [180 0 0 -180/2 0];
a = [c e f 0 0];
theta = [-180 90+theta1 theta2 -90+theta3 0];
theeta = [theta1 theta2 theta3];

j=0;
Tr_t=eye(4);

for i=1:5
   
    T = [cos(theta(i)) -sin(theta(i))*cos(alpha(i))  sin(theta(i))*sin(alpha(i))  a(i)*cos(theta(i));
         sin(theta(i))  cosd(theta(i))*cosd(alpha(i)) -cos(theta(i))*sin(alpha(i))  a(i)*sin(theta(i));
             0                 sin(alpha(i))               cos(alpha(i))                       ds(i);
             0                         0                        0                                1];

         
        T=vpa(T,4);
        fprintf('\nT[%d%d] = \n',i-1,i)
        disp (T)
     
    %Now to calculate the partial derivitive wrt theta[j]
    
    if (i==2||i==3||i==4)
        j=j+1;
        A(1:3) = T (1:3,4);
        B = diff(A,theeta(j));
        C(1:3,j) = B;
        C(4:6,j) = T(1:3,3);
        C=vpa(C,4);
    end    
        
        Tr_t=Tr_t*T;
end

Tr_t=simplify(vpa(Tr_t,4));

%fprintf('The composite transformation Matrix is \nT[r_t] = \n')
%disp (Tr_t)
disp (C)
D = C*(theeta)';
D=vpa(D,4);
disp (D)