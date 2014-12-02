function [Xc] = circularNeighbors(img,x,y,radius)
Xc(:,:)=0;
count=1;
[h w c] = size(img);
if((x-radius)>=0)
    minX = floor(x-radius);
else
    minX=0;
end
if((x+radius)<=w)
    maxX = ceil(x+radius);
else
    maxX = w;
end
if((y-radius)>=0)
    minY = floor(y-radius);
else
    minY = 0;
end
if((y+radius)<=h)
    maxY = floor(y+radius);
else
    maxY = h;
end
for i=minX:maxX
    for j=minY:maxY
        if(sqrt((x-i)^2+(y-j)^2)<=radius)
            Xc(count,1)=i;
            Xc(count,2)=j;
            Xc(count,3)=img(j,i,1);
            Xc(count,4)=img(j,i,2);
            Xc(count,5)=img(j,i,3);
            count=count+1;
        end
    end
end