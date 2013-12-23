function [outImage] = carveVertFast(inImage, pixelOrder, diff, color)
%CARVEVERTFAST Fast vertical seam carving.
% Requires precomputed data from precomputeCarveV. 
% Wrapper for carveHorzFast
% Color is an optional variable, if set the seams will be colored instead
% of removed
trans=permute(inImage, [2 1 3]);
if(nargin<4)
    outImage = carveHorzFast(trans, pixelOrder', diff);
else
    outImage = carveHorzFast(trans, pixelOrder', diff, color);
end
outImage = permute(outImage, [2 1 3]);

end

