# Image_Frequency_Filtering_MatLab
This project aims to suppress interference patterns by bandpass filtering in the frequency domain. The images used can be found in["pck-int.jpg"](https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/pck-int.jpg) and ["primate-caged.jpg"](https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/primate-caged.jpg).  

## The first image
The image "pck-int.jpg" is read and displayed:   
```matlab
Pc1 = imread('pck-int.jpg');
imshow(Pc1)
```
<img src = "https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/pck-int.jpg" width = 300 height = 300>  
As it can be seen, there are parallel lines on the image, and the goal is to remove these lines.  

The Fourier transform is obtained, and power spectrum is displayed with fftshift:  
```matlab
F = fft2(Pc1);
S = abs(F);
imagesc(fftshift(S.^0.1)); 
colormap('default');
```  
<img src = "https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/Figures/image1_spec1.png" width = 642 height = 344>   
  

There are two peaks to the upper right and lower left of the center. In order to get the coordinates of these peaks, the spectrum is displayed without fftshift:  
```matlab
imagesc(S.^0.1);
```
<img src = "https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/Figures/image1_spec2.png" width = 642 height = 344>   
The locations of two symmetric frequency peaks are measured:  
``matlab
[X, Y] = ginput(2)
```  

<img src = "https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/Figures/coorx.png" width = 130 height = 87>
<img src = "https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/Figures/coory.png" width = 130 height = 87>   

The 5x5 neighbourhood elements of the peaks are set to zero in the Fourier transform. The new power spectrum is displayed:  
```matlab
F(floor(Y(1))-2:floor(Y(1))+2, floor(X(1))-2:floor(X(1))+2) = 0; 
F(floor(Y(2))-2:floor(Y(2))+2, floor(X(2))-2:floor(X(2))+2) = 0;
S = abs(F);
imagesc(fftshift(S.^0.1)); 
colormap('default');
```  
<img src = "https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/Figures/image1_spec3.png" width = 642 height = 344>   
The resultant image is obtained using inverse Fourier transform and displayed:
```matlab
F1 = ifft2(F);
F1 = uint8(abs(F1));
imshow(F1)
```  
<img src = "https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/Figures/image1_1.png" width = 300 height = 300>  

The diagonal lines around the center was eliminated, while the lines near the edge are still obvious. A more accurate location measuring helps to produce a better result. One way to improve is to increase the size of neighbourhood that is set to 0.  
Instead of 5x5, 15x15 neighbourhood elements of the peaks are set to 0. The new spectrum and image are displayed:  
<img src = "https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/Figures/image1_spec4.png" width = 642 height = 344>   
<img src = "https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/Figures/image1_2.png" width = 300 height = 300>  
Compared to the image suppressing 5x5 neighbourhood of the peaks, the new image has improved in noise suppressing as more diagonal lines are erased.  



## The second image
The image "primate-caged.jpg" is read and displayed:  
```matlab
Pc2 = imread('primate-caged.jpg');
imshow(Pc2)
```  
<img src = "https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/primate-caged.jpg" width = 300 height = 300>  

The properties of the image are checked:  

```matlab
[rows, columns, numberOfColorChannels] = size(Pc2)
```  

<img src = "https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/Figures/image2_prop.png" width = 270 height = 318>  

It is shown that the image is RGB colored, so it needs to be transformed to grayscale.  

```matlab
Pc2 = rgb2gray(Pc2);
[rows, columns, numberOfColorChannels] = size(Pc2)
```  
<img src = "https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/Figures/image2_prop2.png" width = 270 height = 318>  

Then, the Fourier transform and power spectrum are obtained:  
<img src = "https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/Figures/image2_spec1.png" width = 642 height = 344>   

There are several peaks in the spectrum, and some are not easily identified. After removing some peaks, the resultant spectrum and image are as below:  
<img src = "https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/Figures/image2_spec2.png" width = 642 height = 344>   
<img src = "https://github.com/StephanieMussi/Image_Frequency_Filtering_MatLab/blob/main/Figures/image2_2.png" width = 300 height = 300>   



