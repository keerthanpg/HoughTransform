function [rhos, thetas] = myHoughLines(H, nLines)
%Your implemention here
[m,n]= size(H);
Hnms = H;
rhos=[];
thetas=[];
for i = 2:1:m-1
    for j = 2:1:n-1
        if(H(i,j)>H(i,j+1) && H(i,j)>H(i,j-1) && H(i,j)>H(i+1,j) && H(i,j)>H(i-1,j) && H(i,j)>H(i+1,j+1)&& H(i,j)>H(i-1,j-1) && H(i,j)>H(i-1,j+1) && H(i,j)>H(i+1,j-1))
            Hnms(i,j)=H(i,j);                      
        else Hnms(i,j)=0;
        end     
    end
end
%imshow(Hnms/max(Hnms(:)))
for k=1:1:nLines
    [M,I] = max(Hnms(:));
    [I_row, I_col] = ind2sub(size(Hnms),I);
    rhos=[rhos I_row];
    thetas=[thetas I_col];
    Hnms(I_row, I_col)=0; 
end
rhos=transpose(rhos);
thetas=transpose(thetas);

end

        