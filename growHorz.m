function [outImage] = growHorz(inImage, pixelOrder, diff, color)
%GROWHORZ Grow the given image by the difference
% requires pixelOrder matrix computed by precomputeCarveH
% Color is an optional variable, if set added pixels will be that color

[startHeight startWidth three] = size(inImage);
outImage = [inImage(:, 1:startWidth, :) zeros(startHeight, diff, 3)];

for(j=1:size(inImage,1))
    removeArgs = pixelOrder(j,:)<=diff; % 1 on index if should duplicate
    indicesToDup = removeArgs .* [1:1:startWidth];
    indicesToDup(indicesToDup==0)=[]; % now array of indices to duplicate
    pixels=inImage(j,:,:);
    
    for(i=1:size(indicesToDup,2))
        index=indicesToDup(i);
        outImage(j,index+i:startWidth+i,:)=inImage(j,index:end,:);
        if(index~=startWidth) % Take average of surrounding pixels if not at far right
            outImage(j,index+i,:)=(inImage(j,index,:)+inImage(j,index+1,:)) ./2;
        end
        
        if(nargin==4)
            outImage(j,index+i,:)=color;
        end
    end
end

end

