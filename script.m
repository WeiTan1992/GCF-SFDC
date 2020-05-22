% ----------
% Author: Wei Tan
% E-mail: twtanwei1992@163.com
% Wei Tan, Huixin Zhou, Shenghui Rong, Kun Qian, and Yue Yu, "Fusion of 
% multi-focus images via a Gaussian curvature filter and synthetic focusing
% degree criterion", Applied Optics, 2018, Vol. 57, No.35, pp. 10092-10101.
% This code is only used for research.
% Please cite this publication if you use this code.


clc;
clear all;
close all;

path(path,'CF')

I1 = imread('lab1.tif');
I1 = im2double(I1);

I2 = imread('lab2.tif');
I2 = im2double(I2);

[m,n] = size(I1);

S1 = FeatExt(I1);
S2 = FeatExt(I2);

VOI1 = VOIA(S1,1);
VOI2 = VOIA(S2,1);

SF1 = SpatialFrequencyA(S1,1);
SF2 = SpatialFrequencyA(S2,1);

D1 = zeros(m,n);
for i = 1:m
    for j = 1:n
        if (SF1(i,j)>SF2(i,j) && VOI1(i,j)>VOI2(i,j))
            D1(i,j) = 1;
        else
            D1(i,j) = 0;
        end
    end
end

OM = OptFusMat(D1);
win_size = 10;
W = guided_filter(OM,I1,0.1,win_size);

F = zeros(m,n);
for i = 1:m
    for j = 1:n
        F(i,j) = W(i,j)*I1(i,j)+(1-W(i,j))*I2(i,j);
    end
end

figure,imshow(F);