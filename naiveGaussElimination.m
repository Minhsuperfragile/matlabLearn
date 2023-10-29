##A = [1 1 -1;6 2 2;-3 4 1];
##b = [-3;2;1];

A = [4 1 -1;2 7 1;1 -3 12];
b = [3;19;31];
disp(naiveGausseElimination(A,b));

function result = naiveGausseElimination(A,b)
  n = size(A);
  [A,b] = forwardElimination(A,b,n);
  result = backSubstitude(A,b,n);
end

function [sortedArray,b] = sortArrayForLargestPivot(Array,arraySize,indexOfX)
  rowOfArray = arraySize(1,1);
##  search for a row that has the largest leading coefficant
  pivot = Array(1,:);
  largestRow = 1;
  for row = indexOfX:1:rowOfArray
    if Array(row,indexOfX) >= pivot(1,indexOfX)
      pivot = Array(row,:);
      largestRow = row;
    end
  end
  if Array(largestRow,indexOfX) == 0
    error('All leading coefficant is 0');
  end
##  swap the row that has the largest leading coefficant with row indexOfX
  pivot = Array(indexOfX,:);
  Array(indexOfX,:) = Array(largestRow,:);
  Array(largestRow,:) = pivot;
##  return a new array
  b = Array(:,arraySize(1,2)+1);
  Array(:,arraySize(1,2)+1) = [];
  sortedArray = Array;
end
## this function has complete pivoting
function [upperTriangularMatrix,b] = forwardElimination(Array,b,arraySize)
  rowOfArray = arraySize(1,1);
  columnOfArray = arraySize(1,2);
  for pivotRow = 1:1:(rowOfArray-1)
##  Partial pivoting
    [Array,b] = sortArrayForLargestPivot([Array,b],arraySize,pivotRow);
    for nextRow = (pivotRow+1):1:rowOfArray
      ratio = Array(nextRow,pivotRow) / Array(pivotRow,pivotRow);
      for Column = pivotRow:1:columnOfArray
        Array(nextRow,Column) = Array(nextRow,Column) - ratio*Array(pivotRow,Column);
      end
      b(nextRow) = b(nextRow) - ratio*b(pivotRow);
    end
  end
  upperTriangularMatrix = Array;
end

function solutionMatrix = backSubstitude(Array,b,arraySize)
  rowOfArray = arraySize(1,1);
  columnOfArray = arraySize(1,2);
## initial an empty column matrix as solutionMatrix
  solutionMatrix = zeros(rowOfArray,1);
## get the the value of the last x in the system
  solutionMatrix(rowOfArray) = b(rowOfArray)/Array(rowOfArray,columnOfArray);
##  start back substitute
  for Row = (rowOfArray-1):-1:1
    sum = b(Row);
    for Column = (Row+1):1:columnOfArray
      sum = sum - Array(Row,Column)*solutionMatrix(Column);
    end
    solutionMatrix(Row) = sum / Array(Row,Row);
  end
end
