function [  ] = calculateCustomers(  )
% Summary of this function goes here
%   It will calculate number of customers Storewise

    global customerGrid noOfStores storeCustomers

    storeCustomers = zeros(1,noOfStores);

    for k=1:noOfStores
        storeCustomers(1,k) = sum(customerGrid(:) == k);
    end
end

