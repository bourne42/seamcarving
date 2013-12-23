function [pixelOrder] = precomputeCarveH(inImage)
%PRECOMPUTECARVE precomputes pixel orders on inputImage. 
% Returns an matrix same dimensions as inImage. Each pixel has a value
% 1-width associated with it, 1 means remove first (in first seam).
% Pass data along to carveVertFast along with identical image.
% Same code as carveHorz, just changed part under 'Assign Pixel Order'

[heightStart widthStart three] = size(inImage);

pixelOrder = zeros(heightStart, widthStart);
%total=0;
for(c=1:widthStart)
    [dx, dy] = gradient(inImage);
    dxTot=abs(dx(:,:,1))+abs(dx(:,:,2))+abs(dx(:,:,3));
    dyTot=abs(dy(:,:,1))+abs(dy(:,:,2))+abs(dy(:,:,3));
    
    % assign dTot, this is the energy matrix
    % Change dTot for a different energy function
    dTot=dxTot+dyTot;
    
    [height width dep]=size(inImage);
    weights=zeros(height,width);
    paths=zeros(height,width);
    
    paths(1,:)=[1:1:width];
    weights(1,:)=dTot(1,:);

    for(j=2:height)
        for(i=1:width)
            weights(j,i)=weights(j-1,i)+dTot(j,i);
            paths(j,i)=i;
            
            if(i~=1)
                left=weights(j-1,i-1)+dTot(j,i);
                if(left<weights(j,i))
                    weights(j,i)=left;
                    paths(j,i)=i-1;
                end
            end
            if(i~=width)
                right=weights(j-1,i+1)+dTot(j,i);
                if(right<weights(j,i))
                    weights(j,i)=right;
                    paths(j,i)=i+1;
                end
            end
        end
    end
    
    outImage = inImage(1:end,1:end-1,:);
    
    [minPath index]=min(weights(height,:));
    %fix the each row individually
    for(j=1:height)
        outImage(j,index:end,:)=inImage(j,index+1:end,:);
        
        %Assign Pixel Order
        freeSpaces=0;
        for(i=1:widthStart)
            if(pixelOrder(j,i)<1)
                freeSpaces=freeSpaces+1;
            end
            if(freeSpaces==index)
                pixelOrder(j,i)=c;
                break;
            end
        end
        
        if(j~=height)
            index=paths(j+1,index);
        end
    end
    
    inImage=outImage;
end

end

