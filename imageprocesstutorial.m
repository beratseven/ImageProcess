clear all;
close all;
clc;
% paketi yükle
pkg load image;
% görüntüyü yükle
img = imread('pp.jpg');

%görüntüyü siyah beyaz yap
grayscale_img = rgb2gray(img);

% görüntüyü göster
figure
imshow(grayscale_img);
title('SiyahBeyaz');
imwrite(grayscale_img, 'original.jpg');

% görüntüyü tersine çevir BeyazSiyah
output_negative = 255 - grayscale_img;

% beyazsiyah görntüyü göster
figure
imshow(uint8(output_negative));
title('BeyazSiyah');
imwrite(uint8(output_negative), 'negative_transformation.jpg');

% contrast-stretched işlemi yap
a = min(grayscale_img(:));
b = max(grayscale_img(:));
cs_img = (grayscale_img - a) .* (255 / (b - a));

% contrast-stretched görüntüyü göster
figure
imshow(uint8(cs_img));
title('Contrast-Stretched Image');
imwrite(uint8(cs_img), 'contrast_stretched.jpg');

% Histogram equalization işlemi yap
hist_eq_img = histeq(grayscale_img);

% histogram equalization görüntüyü göster
figure
imshow(hist_eq_img);
title('Histogram-Equalized Image');
imwrite(hist_eq_img, 'histogram_equalized.jpg');

% histogramları görüntüle
figure
subplot(2,2,1);
imhist(grayscale_img);
title('Orijinal Goruntu Histogram');

subplot(2,2,2);
imhist(uint8(output_negative));
title('SiyahBeyaz Goruntu Histogram');

subplot(2,2,3);
imhist(uint8(cs_img));
title('Contrast-Stretched Hıstogram');

subplot(2,2,4);
imhist(hist_eq_img);
title('Histogram-Equalized Image Histogram');

