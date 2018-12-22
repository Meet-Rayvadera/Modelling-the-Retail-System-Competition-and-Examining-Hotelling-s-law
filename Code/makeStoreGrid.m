function [ storeGrid ] = makeStoreGrid( n, storeLocation )
% Summary of this function goes here
%   It will just create Grid of stores from location details of stores so
%   we can visualize stores location wise

    storeGrid = zeros(n);
    rows = size(storeLocation);
    rows = rows(1,1);
    
    for i=1:rows
        storeGrid(storeLocation(i,1), storeLocation(i,2)) = i;
    end
    
end

