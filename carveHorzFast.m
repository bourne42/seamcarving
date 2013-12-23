function [outImage] = carveHorzFast(inImage, pixelOrder, diff, color)
%CARVEVERTFAST Fast horizontal seam carving.
% Requires precomputed data from precomputeCarveH.
% Color is an optional variable, if set the seams will be colored instead
% of removed

[startHeight startWidth three] = size(inImage);
if(nargin<4)
    outImage = inImage(:, 1:startWidth-diff, :);
else
    outImage = inImage;
end

for(j=1:startHeight)
    removeArgs = pixelOrder(j,:)<=diff; % 1 on index if should remove
    indicesToRemove = removeArgs .* [1:1:startWidth];
    indicesToRemove(indicesToRemove==0)=[]; % now array of indices to remove
    
    if(nargin<4) % remove pixel
        pixels=inImage(j,:,:);
        pixels(:,indicesToRemove,:)=[];%filter out unwanted pixels
        outImage(j,:,:) = pixels;
    else % replace with red color
        for(in=1:diff)
            outImage(j,indicesToRemove(in),:)=color;
        end
    end
end

end

