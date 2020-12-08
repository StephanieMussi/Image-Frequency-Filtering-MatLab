% 2.5 Suppressing Noise Interference Patterns
% Written by: Mu Siyi
% Date: 23/09/2020

Pc1 = imread('pck-int.jpg');
imshow(Pc1)

F = fft2(Pc1);
S = abs(F);
imagesc(fftshift(S.^0.1)); 
colormap('default');

imagesc(S.^0.1);
[X, Y] = ginput(2)

F(floor(Y(1))-2:floor(Y(1))+2, floor(X(1))-2:floor(X(1))+2) = 0; 
F(floor(Y(2))-2:floor(Y(2))+2, floor(X(2))-2:floor(X(2))+2) = 0;
S = abs(F);
imagesc(fftshift(S.^0.1)); 
colormap('default');

F1 = ifft2(F);
F1 = uint8(abs(F1));
imshow(F1)

% Improvement -- 15x15
F(floor(Y(1))-7:floor(Y(1))+7, floor(X(1))-7:floor(X(1))+7) = 0; 
F(floor(Y(2))-7:floor(Y(2))+7, floor(X(2))-7:floor(X(2))+7) = 0;
S = abs(F);
imagesc(fftshift(S.^0.1)); 
colormap('default');

F1 = ifft2(F);
F1 = uint8(abs(F1));
imshow(F1)

