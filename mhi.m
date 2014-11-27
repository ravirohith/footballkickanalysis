clear all
st=2;
ed=13;
n=ed-st+1;
h=390;
w=640;
backgrnd = (imread('y (1).png'));
%{
for i=1:4
filename = sprintf('bg%d.png', i);
Imb(:,:,:,i) = double(imread(filename));
end
s1=0;
for i=1:1080
    for j=1:1920
        for l=1:3
            for k=1:4
                s1=s1+Imb(i,j,l,k);
            end
        M(i,j,l)= s1/4;
        s1=0;
        end
    end
end
%}

for i=1:ed
    filename=sprintf('y (%d).png',i);
    test(:,:,:,i)=imread(filename);
end

for i=st:ed
filename = sprintf('y (%d).png', i);
Im(:,:,:,i-st+1) = double((imread(filename)-backgrnd));
end
MHI(:,:,n) =zeros(480,w);
for i=2:n
    imgt = abs(Im(:,:,:,i)-Im(:,:,:,i-1));
    %imgt = bwareaopen(imgt,10);
    for j=1:h
        for k=1:w
            if(imgt(j,k,1)>10 && imgt(j,k,2)>10 && imgt(j,k,3)>10)
                MHI(j,k,i)=i;
            else
                MHI(j,k,i)=max(0,MHI(j,k,i-1));
            end
        end
    end
end
se = strel('ball',5,5);
%MHI(:,:,n)=imdilate(MHI(:,:,n),se);
%MHI(:,:,n) = bwareaopen(MHI(:,:,n),10);
imagesc(uint8(MHI(:,:,n)));
pImg = MHI(:,:,n);
colormap('gray');
hold on;
%%
pos=zeros(12,2);
for i=(h/2):h
    for j=1:w
        if(pImg(i,j)~=0)
            if(pos(pImg(i,j),1)<i)
                pos(pImg(i,j),1)=i;
                pos(pImg(i,j),2)=j;
            end
        end
    end
end
plot(pos(:,2),pos(:,1),'rO');