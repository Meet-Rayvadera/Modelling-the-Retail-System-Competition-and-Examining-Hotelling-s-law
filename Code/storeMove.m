function [  ] = storeMove(  )
%Summary of this function goes here
%   This will change location of stores optimally (means only if it is
%   getting larger base of customers) irrespective of location of other stores but will take
%   care of collisions

    global customerGrid n storeLocation noOfStores storeCustomers storeGrid;
    
    % Iterating through all stores will change storeLocation data so in
    % each iteration, location details will be restored and new details
    % will be saved and updated at last
    storeLocationOld = storeLocation;
    customerGridOld = customerGrid;
    storeCustomersOld = storeCustomers;
    
    storeLocationNew = storeLocation;
    
    
    for i=1:noOfStores
        x = storeLocation(i,1);
        y = storeLocation(i,2);
        
        
        % Generate direction randomly and take care of boundary
        temp=1;
        
        while temp == 1
                dir = randi(4,1,1); % 1:North, 2:East, 3:South, 4:West

                temp=0;               
                
                if x==1 && dir==1
                    while dir==1
                        dir = randi(4,1,1);
                    end
                end
                if y==1 && dir==4
                    while dir==4
                        dir = randi(4,1,1);
                    end
                end
                if x==n && dir==3
                    while dir==3
                        dir = randi(4,1,1);
                    end
                end
                if y==n && dir==2
                    while dir==2
                        dir = randi(4,1,1);
                    end
                end

                % Move store in dir 
                if dir==1
                    storeLocation(i,1) = x-1;
                end
                if dir==2
                    storeLocation(i,2) = y+1;
                end
                if dir==3
                    storeLocation(i,1) = x+1;
                end
                if dir==4
                    storeLocation(i,2) = y-1;
                end
                
                % limit : Maximum number of directions in which store can move
                if (x==1 && y==1) || (x==1 && y==n) || (x==n && y==1) || (x==n && y==n)
                    limit=2;
                elseif x==1 || x==n || y==1 || y==n
                    limit=3;
                else
                    limit=4;
                end

                % Check collisions
                count=0;
                for j=1:noOfStores
                    if (j~=i) && (storeLocation(i,1) == storeLocationNew(j,1)) && (storeLocation(i,2) == storeLocationNew(j,2))
                        temp = 1;
                        count = count + 1;
                    end
                end
                
                % Don't move if all neighbouring positions are filled
                if count == limit
                    storeLocation(i,1) = storeLocationOld(i,1);
                    storeLocation(i,2) = storeLocationOld(i,2);
                end
        end
                
        % Calculate new number of customers after changing location
        updateCustomerGrid();
        calculateCustomers();
        
        if storeCustomers(1,i) > storeCustomersOld(1,i) % Store will move but won't be visible to other stores in this time step
            storeLocationNew(i,1) = storeLocation(i,1);
            storeLocationNew(i,2) = storeLocation(i,2);
        else % Store won't move
            storeLocationNew(i,1) = storeLocationOld(i,1);
            storeLocationNew(i,2) = storeLocationOld(i,2);
        end
        
        % Restore
        storeLocation = storeLocationOld;
        customerGrid = customerGridOld;
        storeCustomers = storeCustomersOld;
        
    end
    
    storeLocation = storeLocationNew;
    updateCustomerGrid();
    calculateCustomers();
    storeGrid = makeStoreGrid(n, storeLocation);
end

