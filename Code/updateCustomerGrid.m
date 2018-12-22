function [  ] = updateCustomerGrid(  )
%Summary of this function goes here
%   This function will decide store for each customer according to distance
%   from all stores if distance is same to more than one stores then will
%   decide randomly from them

    global customerGrid n noOfStores storeLocation storePrice
    
    for i=1:n
        for j=1:n
            
            min = distanceFormula(storePrice(1,1), [i j], storeLocation(1,:) );
            distance = zeros(1, noOfStores);
            
            sameDistance = zeros(noOfStores);
            count = 2;
            
            for k=1:noOfStores
                distance(1,k) = distanceFormula(storePrice(1,k), [i j], storeLocation(k,:) );
                
                if distance(1,k) <= min
                    min = distance(1,k);
                    sameDistance(1) = k;
                end
            end
            
                
    % If same distance to more than one stores then have to choose randomly between them
            
            
            for k=1:noOfStores
                if distance(1,k) == min && k ~= sameDistance(1)
                    sameDistance(count) = k;
                    count = count + 1;
                end
            end
           
            nearestStore = sameDistance(randi(count-1,1,1));
            customerGrid(i,j) = nearestStore;

        end
    end
    
    % For showing stores on customer grid
    for i=1:noOfStores
        customerGrid(storeLocation(i,1), storeLocation(i,2)) = i + noOfStores;
    end

    
end

