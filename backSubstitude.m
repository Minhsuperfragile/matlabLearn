function solutionMatrix = backSubstitude(Array,b,arraySize)
  rowOfArray = arraySize(1,1);
  columnOfArray = arraySize(1,2);
% initial an empty column matrix as solutionMatrix
  solutionMatrix = zeros(rowOfArray,1);
% get the the value of the last x in the system
  solutionMatrix(rowOfArray) = b(rowOfArray)/Array(rowOfArray,columnOfArray);
%  start back substitute
  for Row = (rowOfArray-1):-1:1
    sum = b(Row);
    for Column = (Row+1):1:columnOfArray
      sum = sum - Array(Row,Column)*solutionMatrix(Column);
    end
    solutionMatrix(Row) = sum / Array(Row,Row);
  end
end