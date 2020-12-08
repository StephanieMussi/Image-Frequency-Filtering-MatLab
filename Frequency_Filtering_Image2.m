% 2.5 Suppressing Noise Interference Patterns
% Written by: Mu Siyi
% Date: 22/09/2020

Pc2 = imread('primate-caged.jpg');
imshow(Pc2)

% Check whether the image is in RGB or grayscale
whos Pc2
[rows, columns, numberOfColorChannels] = size(Pc2)
% Convert the image to grayscale
Pc2 = rgb2gray(Pc2);
% Confirm the new image is in grayscale
whos Pc2
[rows, columns, numberOfColorChannels] = size(Pc2)

F=fft2(Pc2);
S = abs(F);
imagesc(fftshift(S.^0.1)); 
colormap('default');
[X, Y] = ginput(12)

F(250:254, 9:13) = 0;
F(4:8, 244:248) = 0;
F(246:250, 19:23) = 0;
F(8:12,234:238) = 0;
F(240:244, 7:11) = 0;
F(13:17, 246:250) = 0;
F(18:22, 235:239) = 0;
F(236:240, 18:22) = 0;
F(12:16, 223:227) = 0;
F(241:245, 30:34) = 0;
F(1:4, 20:24) = 0;
F(253:256, 231:235) = 0;

S = abs(F);
imagesc(fftshift(S.^0.1)); 
colormap('default');

F1 = ifft2(F);
F1 = uint8(abs(F1));
imshow(F1)

