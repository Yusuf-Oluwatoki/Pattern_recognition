% saveplots = true;
% global fid
% fid = [];
nPoints = 50;

% Initialise the kernel size
kernelSize = [.025, .05, .1, .15, .2, .25, .5, 1];

load irisdata;

figure(1);
gplotmatrix(traindata', [], trainclass');
% if saveplots
%   savefigure(mfilename);
% end

% Select two dimensions for the visualisation
l = [3, 4];
[dataMin, dataMax] = bounds(traindata, 2);
dataRange = dataMax - dataMin;

figure(2);

% Iterate through the kernel sizes
for kernelInd = 1:length(kernelSize)
  % Classify the data
  d = kdclassification(trainclass, traindata, data, kernelSize(kernelInd));
  acc(kernelInd) = sum(d == dataclass) / length(dataclass);
  
  % Prepare for the visualisation
  [X, Y] = meshgrid(dataMin(l(1)):dataRange(l(1))/(nPoints-1):dataMax(l(1)), ...
    dataMin(l(2)):dataRange(l(2))/(nPoints-1):dataMax(l(2)));
  D = [X(:) Y(:)];
  d = kdclassification(trainclass, traindata(l,:), D', kernelSize(kernelInd));
  
  hold off;
  plotdata(trainclass, traindata(l, :), 'o');
  hold on;
  plotdata(d, D');
  title(sprintf('Kernel size %f', kernelSize(kernelInd)));
  drawnow;
%   if saveplots
%     savefigure(mfilename);
%   else
%     pause(0.5);
%   end
end
