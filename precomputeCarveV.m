function [pixelOrder] = precomputeCarveV(inImage)
%PRECOMPUTECARVEV precomputes pixel orders on inputImage. 
% Returns an matrix same dimensions as inImage. Each pixel has a value
% 1-height associated with it, 1 means remove first (in first seam).
% Pass data along to carveVertFast along with identical image
trans=permute(inImage, [2 1 3]);
pixelOrder = precomputeCarveH(trans);
pixelOrder = pixelOrder';

end

