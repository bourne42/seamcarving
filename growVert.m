function [outImage] = growVert(inImage, pixelOrder, diff, color)
%GROWHORZ Grow the given image by the difference
% requires pixelOrder matrix computed by precomputeCarveV
% Color is an optional variable, if set added pixels will be that color
% Wrapper for growHorz
trans=permute(inImage, [2 1 3]);
if(nargin<4)
    outImage = growHorz(trans, pixelOrder', diff);
else
    outImage = growHorz(trans, pixelOrder', diff, color);
end
outImage = permute(outImage, [2 1 3]);

end