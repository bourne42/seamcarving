function [outImage] = carveHorz(inImage, diff)
%CARVEHORZ carve seam to change horizontal dimension (slow)
% diff must be greater than 0

for(c=1:diff)
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
        
        if(j~=height)
            index=paths(j+1,index);
        end
    end
    
    %change inImage to prepare for the next iteration if there is one
    if(c~=diff)
        inImage=outImage;
        %dTot=dTotNew;
    end
end

end