function [w] = meanshiftWeights(X,q,p)
[rx cx] = size(X);
bins = size(q,1);
w = zeros(rx);
for i=1:rx
    if(p(floor(1+(X(i,3)/bins)),floor(1+(X(i,4)/bins)),floor(1+(X(i,5)/bins)))~=Inf && p(floor(1+(X(i,3)/bins)),floor(1+(X(i,4)/bins)),floor(1+(X(i,5)/bins)))~=0)
        w(i)=sqrt(q(floor(1+(X(i,3)/bins)),floor(1+(X(i,4)/bins)),floor(1+(X(i,5)/bins)))/p(floor(1+(X(i,3)/bins)),floor(1+(X(i,4)/bins)),floor(1+(X(i,5)/bins))));
    end
end