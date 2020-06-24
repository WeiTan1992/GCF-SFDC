clear;

I1 = imread('clockA.tif');
I2 = imread('clockB.tif');

FilterType = 2;
Iteration1 = 0;
Iteration2 = 50;

[result1_1,energy1_1]=CF(I1,FilterType, Iteration1);
[result1_2,energy1_2]=CF(I1,FilterType, Iteration2);
[result2_1,energy2_1]=CF(I2,FilterType, Iteration1);
[result2_2,energy2_2]=CF(I2,FilterType, Iteration2);

result1_1 = uint8(result1_1);
result1_2 = uint8(result1_2);
result2_1 = uint8(result2_1);
result2_2 = uint8(result2_2);
D1 = result1_2-result1_1;
D2 = result2_2-result2_1;

figure,imshow(I1);
figure,imshow(I2);
figure,imshow(D1,[]);
figure,imshow(D2,[]);