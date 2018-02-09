function [img1] = myImageFilterX(img0, h)
    [m,n]= size(img0);%dimensions of image
    [p,q]= size(h);%dimensions of filter      
    padimg=padarray(img0,[p-1 q-1],'replicate','pre');
    img1=zeros(m,n);     
    H=repmat(transpose(h(:)),n,1);
    j=1:1:p*q;    
    j=repmat(j, n,1);        
    k=1:p:n*p;
    k=k-1;
    k=transpose(k);
    k=repmat(k,1,p*q); 
    j=j+k;% j is 640 * 361 each row containing one sequence
    for i=1:1:m       
        g=padimg(i:i+p-1, :);       
        g=g(:);
        g=g(j);        
        n=g.*H;       
        img1(i, :)= transpose(sum(n,2));
        size(img1(i,:))
    end
    
end