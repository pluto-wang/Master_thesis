function d = degree(a1x,a1y,bx,by,a2x,a2y)
     AB = [bx-a1x by-a1y];
     AA = [a1x-a2x a1y-a2y];
     D = dot(AB,AA)/(norm(AB)*norm(AA)); % calculate degree
     d = rad2deg(acos(D));
end
