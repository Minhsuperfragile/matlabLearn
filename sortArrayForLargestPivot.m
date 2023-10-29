function [sortedArray,b] = sortArrayForLargestPivot(Array,arraySize,indexOfX)
  rowOfArray = arraySize(1,1);
%  search for a row that has the largest leading coefficant
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
%  swap the row that has the largest leading coefficant with row indexOfX
  pivot = Array(indexOfX,:);
  Array(indexOfX,:) = Array(largestRow,:);
  Array(largestRow,:) = pivot;
%  return a new array
  b = Array(:,arraySize(1,2)+1);
  Array(:,arraySize(1,2)+1) = [];
  sortedArray = Array;
end