clear all
tx=612;
ty=261;
%tx=1310;
%ty=654;
r=50;
img1 = double(imread('z (23).jpg'));
img2 = double(imread('z (24).jpg'));
Xm = circularNeighbors(img1,tx,ty,r);
histXm = colorHistogram(Xm,16,tx,ty,r);
histXm = histXm/sum(sum(sum(histXm)));
Xp = circularNeighbors(img2,tx,ty,r);
x=tx;
y=ty;
for m=1:25
    Xp = circularNeighbors(img2,x,y,r);
    p_t = colorHistogram(Xp,16,x,y,r);
    p_t = p_t/sum(sum(sum(p_t)));
    We = meanshiftWeights(Xp,histXm,p_t);
    knum=0;
    kden=0;
    for v=1:size(Xp,1)
        knum = knum + [Xp(v,1) Xp(v,2)]*We(v,1);
        kden = kden + (We(v,1));
    end
    Ed = sqrt((x-(knum(1,1)/kden))^2 + (y-(knum(1,2)/kden))^2);
    x=knum(1,1)/kden;
    y=knum(1,2)/kden;
end

imshow(uint8(img2));
hold on
rect_H = rectangle('Position', [x-10,y-10,r,r]); 
set(rect_H, 'EdgeColor', [0, 1, 0]);  
rect_H1 = rectangle('Position', [tx-10,ty-10,r,r]); 
set(rect_H1, 'EdgeColor', [1, 0, 0]);
A = [x y]; 
B = [tx ty]; 
plot(A,B,'*')
%axis([0 1920 0 1080])
hold on
%line(A,B)
hold off