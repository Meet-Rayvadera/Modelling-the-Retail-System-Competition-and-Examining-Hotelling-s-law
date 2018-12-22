function [  ] = priceMove(  )
% Summary of this function goes here
%   This function will change price for each store irrespective of prices
%   of other stores. If it has greater than equal share then it will
%   increase price otherwise keep it constant or decrease randomly keeping
%   boundary condition in consideration
    
    global n storePrice noOfStores storeCustomers;
    
    for i=1:noOfStores

        customerShare = storeCustomers(1,i)/(n*n);  % Share of total customers 
        
        % mov = 1 for price decrease
        % mov = 2 for no change in price
        % mov = 3 for price increase
        
        if customerShare >= 1/noOfStores  % If share is greter than equally distributed then it will increase price
            mov = 3;
        else                              % Else it will either decrease prices or keep it constant
            mov = randi(2,1,1);
        end
        
        % Price should not be Negative
        if mov == 1 && storePrice(1,i) == 1
            mov = 2;
        end
        
        % Update Price according to decision made above
        if mov == 1
            storePrice(1,i) = storePrice(1,i) - 1;
        end
        if mov == 3
            storePrice(1,i) = storePrice(1,i) + 1;
        end
        
    end

    % Change customer grid according to new prices of stores
    updateCustomerGrid();
    calculateCustomers();    
    
end

