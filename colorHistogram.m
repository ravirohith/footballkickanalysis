function [h] = colorHistogram(X,bins,x,y,b)
h=zeros(bins,bins,bins);
[rx cx] = size(X);
nV = [x y];
numS = zeros(rx);
for i=1:rx
    tV = [X(i,1) X(i,2)];
    num = norm((nV-tV)/b);
    numS(i) = num*num;
    h(floor(1+(X(i,3)/bins)),floor(1+(X(i,4)/bins)),floor(1+(X(i,5)/bins)))=h(floor(1+(X(i,3)/bins)),floor(1+(X(i,4)/bins)),floor(1+(X(i,5)/bins)))+max(0,1-(numS(i)));
end
%h=h/sum(sum(sum(h)));