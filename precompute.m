function [pixelOrderH pixelOrderV] = precompute(inImage)
%PRECOMPUTE returns the precomputed data for horizontal and vertical seams

pixelOrderH=precomputeCarveH(inImage);
pixelOrderV=precomputeCarveV(inImage);

end