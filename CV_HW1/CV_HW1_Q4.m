
L = [0 1 0; 1 -4 1; 0 1 0]
G11 = Gaussian(11,1)
N = conv2(G11,L)

mesh(N) , title('Laplacian of Gaussian ')
