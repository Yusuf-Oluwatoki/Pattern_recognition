saveplots = false;
global fid
fid = [];

load('irisdata.mat');
data = data';
col = ['r', 'g', 'b', 'k'];

nClusters = [2, 3, 4, 5]; % The number of clusters

rng('default');
for caseInd = 1:length(nClusters)
  [C, M, objFun] = fcm(data, nClusters(caseInd));
  [maxM, maxInd] = max(M);
  
  fh(caseInd) = figure;
%   plot(data(:,1), data(:,2), 'o');
%   hold on;
%   for clustInd = 1:size(M, 1)
%     ind{clustInd} = find(M(clustInd, :) == maxM);
%     line(data(ind{clustInd}, 1), data(ind{clustInd}, 2), ...
%       'linestyle', 'none', 'marker', '.', 'color', col(clustInd));
%   end
  gplotmatrix(data, data, maxInd);
  title(sprintf('%d clusters', nClusters(caseInd)));
  if saveplots
    savefigure(mfilename);
  end
end
