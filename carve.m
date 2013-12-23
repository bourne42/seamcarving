function [outImage] = carve(inImage, horzDiff, vertDiff)
%CARVE performs seam carving on inImage
% horzDiff and vertDiff are how much to cut off from inImage
outImage = inImage;
if(horzDiff ~= 0)
    outImage = carveHorz(outImage, horzDiff);
end
if(vertDiff ~= 0)
    outImage = carveVert(outImage, vertDiff);
end

%a=[outImage zeros(size(outImage,1), horzDiff, 3)];
%a=[a; zeros(vertDiff, size(a,2), 3)];
%imshow([[inImage; a] [a; zeros(size(inImage))]]);

end