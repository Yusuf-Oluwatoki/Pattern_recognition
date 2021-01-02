function v = s075(x)
% s009   Compute the unbiased variance estimate

if size(x, 1) == 1
  x = x';
end
m = s009(x);
n = size(x, 1);
for colInd = 1:size(x, 2)
  s = 0;
  for rowInd = 1:n
    s = s + (x(rowInd, colInd) - m(colInd)) ^ 2;
  end
  v(colInd) = s / (n - 1);
end
