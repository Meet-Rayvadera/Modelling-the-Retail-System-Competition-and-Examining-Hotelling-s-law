function [  ] = initiateGrids(  )
% Summary of this function goes here
%  This function will randomly place store on n*n grid such that they don't overlap
%  Also it will initialize initial prices store wise which can be same for
%  2 different stores

    global customerGrid n storeLocation storePrice noOfStores
%%    
    customerGrid = zeros(n);
    storeLocation = zeros(noOfStores, 2);
        
    t1 = randperm(n*n, noOfStores); % Generates unique random noOfStores values from 1 to n*n
    
    % Arrange stores accordingly
    for i=1:noOfStores
        rowNo = ceil(t1(1,i)/n);
        columnNo = rem(t1(1,i),n);
        
        if columnNo == 0
            columnNo = 5;
        end
        
        storeLocation(i,1) = rowNo;
        storeLocation(i,2) = columnNo;
    end
%%    
    % Initialize Price
    storePrice = randi([90 110], 1, noOfStores);
    
end

