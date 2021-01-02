function [C, P, mu, Sigma] = bayes3(trainclass, traindata, testdata)

l = size(testdata, 1); % number of dimensions
nClasses = max(trainclass); % number of classes
nTrain = length(traindata); % number of training samples

P = zeros(1, nClasses);
mu = zeros(l, nClasses);
Sigma = zeros(l, l, nClasses);

for classInd = 1:nClasses
  sampleInd = traindata(:, find(trainclass == classInd));
  P(classInd) = length(sampleInd) / nTrain; % a priori probability
  mu(:, classInd) = mean(sampleInd, 2); % mean
  Sigma(:, :, classInd) = cov(sampleInd'); % covariance
end

% Now that the a priori prababilities, means and covariances are estimated,
% classify by using the bayesian classifier
% C = bayes1(mu, Sigma, data);
C = bayes1apr(P, mu, Sigma, testdata);

end