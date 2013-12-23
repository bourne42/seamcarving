function [outImage] = carveVert(inImage, diff)
%CARVEVERT carve seam to change vertical dimension (slow)
% Wrapper for carveHorz
trans=permute(inImage, [2 1 3]);
outImage = carveHorz(trans, diff);
outImage = permute(outImage, [2 1 3]);

end