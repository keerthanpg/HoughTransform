function [H, rhoScale, thetaScale] = myHoughTransform(Im, threshold, rhoRes, thetaRes)
%Your implementation here
%Im - grayscale image - 
%threshold - prevents low gradient magnitude points from being included
%rhoRes - resolution of rhos - scalar
%thetaRes - resolution of theta - scalar
tol=0.5;
[m,n]=size(Im);
rhoScale=(-1)*ceil(sqrt(m*m+n*n)):rhoRes:ceil(sqrt(m*m+n*n));
thetaScale=0:thetaRes:pi;
p=size(rhoScale);
q=size(thetaScale);
H=zeros(p(1,2), q(1,2));
sintheta=sin(thetaScale);
costheta=cos(thetaScale);
for i=2:1:m-1
    for j=2:1:n-1
        if(Im(i,j)>threshold)
            for k=1:1:q(1,2)                
                %sum(ismembertol(rhoScale, j*cos(thetaScale(1,k))+i*sin(thetaScale(1,k)), tol))
                H(:,k) = H(:,k)+ transpose(ismembertol(rhoScale, j*costheta(1,k)+(-i)*sintheta(1,k), tol)); 
                %H(:,k) = H(:,k)+ transpose(abs(j*costheta(1,k)+(-i)*sintheta(1,k)-rhoScale)<tol);
            end
        end
    end
end

rhoScale=transpose(rhoScale);
thetaScale=transpose(thetaScale);
end
        
        
