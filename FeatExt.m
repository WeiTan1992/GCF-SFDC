function J = FeatExt(I)
% This function implements a method of feature extraction 
% via Gaussian curvature filter.

% J - feature image
% I - input image

FilterType = 2;
Iteration = 10;

[result, energy] = CF(I,FilterType,Iteration);

J = result-I;
