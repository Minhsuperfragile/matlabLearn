function errorList = calculateError(list)
    sizeOfList = size(list)
    errorList = zeros(sizeOfList(1)-1,1);
    for index = 2:1:sizeOfList(1)
        errorList(index-1) = abs((list(index) - list(index-1))/list(index))*100;
    end
end