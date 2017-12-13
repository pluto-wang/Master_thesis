function d = distance(p1,p2,b1,b2)
     pos = [p1 p2;b1 b2];
     d = pdist(pos,'euclidean');
end