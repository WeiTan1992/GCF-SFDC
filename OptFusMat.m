function OM = OptFusMat(CFM)
% This function implements the optimization of the coarse fusion matrix  

% CFM - coarse fusion matrix
% OM - optimized fusion matrix

se = strel('square',2);
W = imopen(CFM,se);
OM = imclose(W,se);
OM = medfilt2(OM,[35 35]);
sse = strel('disk',15);
OM = imdilate(OM,sse);
