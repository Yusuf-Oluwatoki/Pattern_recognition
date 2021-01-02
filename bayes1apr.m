function [C] = bayes1apr(P, mu, Sigma, data)

nClasses = length(P); % number of classes
nSamples = size(data, 2); % number of examples

D = zeros(nClasses, nSamples); % log-likelihood

for classInd = 1:nClasses
  W = -1/2 * inv(Sigma(:, :, classInd));
  w = inv(Sigma(:, :, classInd)) * mu(:, classInd);
  w0 = -1/2 * mu(:, classInd)' * inv(Sigma(:, :, classInd)) * mu(:, classInd) - ...
    1/2 * log(det(Sigma(:, :, classInd))) + log(P(classInd));

  for sampleInd = 1:nSamples
    D(classInd, sampleInd) = data(:, sampleInd)' * W * data(:, sampleInd) + ...
      w' * data(:, sampleInd) + w0;
  end
end

[tmp C] = max(D); % classification based on maximum likelihood

end