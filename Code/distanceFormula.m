function [ distance ] = distanceFormula( price, customerLocation, storeLocation )
% Summary of this function goes here
%   It will give distance between customer and specific store which is
%   addition of price that store offers plus actual physical distance

    dis1 = sqrt(dot( storeLocation - customerLocation , storeLocation - customerLocation ));
    dis2 = price;
    
    distance = dis1 + dis2;
    
end

