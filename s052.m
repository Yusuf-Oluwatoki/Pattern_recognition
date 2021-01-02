saveplots = false;
global fid
fid = [];

load('irisdata.mat');

nIter = 5;
nClusters = [2, 3, 4, 5]; % The number of clusters

rng('default');
for caseInd = 1:length(nClusters)
  for iter = 1:nIter
    [ind, C, sumd, D] = kmeans(data', nClusters(caseInd), 'Display', 'iter');
    indices(:, iter) = ind; % The variation can be studied further
  end
  fh(caseInd) = figure;
  silhouette(data', ind);
  title(sprintf('%d clusters', nClusters(caseInd)));
  if saveplots
    savefigure(mfilename);
  end
end

% E = evalclusters(data', 'kmeans', 'silhouette', 'klist', [2:5])