function m = s009(x)
% s009   Compute the mean

if size(x, 1) == 1
  x = x';
end
n = size(x, 1);
for colInd = 1:size(x, 2)
  s = 0;
  for rowInd = 1:n
    s = s + x(rowInd, colInd);
  end
  m(colInd) = s / n;
end
