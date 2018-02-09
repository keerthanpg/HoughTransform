function [img1] = myImageFilter(img0, h)
    [m,n]= size(img0);%dimensions of image
    [p,q]= size(h);%dimensions of filter    
    padimg=padarray(img0,[p-1 q-1],'replicate','pre');
    img1=zeros(m,n);
    for i = 1:1:m
      for j = 1:1:n
          img1(i,j)=sum(sum(padimg(i:i+p-1,j:j+q-1).*h));
      end
    end
end
