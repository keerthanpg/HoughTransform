function [Im Io Ix Iy] = myEdgeFilter(img, sigma)
%Your implemention
    hsize=2*ceil(3*sigma)+1;
    h = fspecial('gaussian',hsize,sigma);
    img1=myImageFilter(img,h);
    x = fspecial('sobel');
    Ix = myImageFilter(img1,x);
    Iy = myImageFilter(img1,transpose(x));
    Io = atan(Iy./Ix);
    Im = sqrt(Ix.*Ix + Iy.*Iy);
    [m,n]= size(Im);
    Inms = Im;
    for i = 2:1:m-1
        for j = 2:1:n-1
            if Io(i,j)> pi/4
                if (Im(i-1,j+1)>Im(i,j) || Im(i+1,j-1)>Im(i,j))
                    Inms(i,j)=0;
                end                
            elseif Io(i,j)<-pi/4
                if (Im(i-1,j)>Im(i,j) || Im(i+1,j)>Im(i,j))
                    Inms(i,j)=0;
                end
            elseif ((Io(i,j)<=pi/4) && (Io(i,j)>=0))
                if (Im(i,j-1)>Im(i,j) || Im(i,j+1)>Im(i,j))
                    Inms(i,j)=0;
                end
            elseif ((Io(i,j)>=-pi/4) && (Io(i,j)<0))
                if (Im(i-1,j-1)>Im(i,j) || Im(i+1,j+1)>Im(i,j))
                    Inms(i,j)=0;
                end
            end            
        end
    end
    for i = 1:1:m
        Inms(i,1)=0;
        Inms(i,n)=0;
    end
    for j = 1:1:n
        Inms(1,j)=0;
        Inms(m,j)=0;
    end
    Im=Inms;  
end
    
                
        
        
