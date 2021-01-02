global fid
fid = [];

pTrain = 0.5;

load bayes1data

dataInd = randperm(size(data, 2));
trainInd = dataInd(1:floor(size(data, 2) * pTrain));
testInd = dataInd(floor(size(data, 2) * pTrain) + 1:end);
trainClasses = classes(trainInd);
trainData = data(:, trainInd);
testClasses = classes(testInd);
testData = data(:, testInd);

plot(trainData(1, :), trainData(2, :), 'k.');
hold on;
plot(testData(1, :), testData(2, :), 'm.');
h = plotclass(mu, Sigma);
for i = 1:length(h)
  set(h(i), 'LineStyle', ':');
end
hold on;

[C, Pest, muEst, SigmaEst] = bayes3(trainClasses, trainData, testData);
h = plotclass(muEst, SigmaEst);
correctInd = find(C == testClasses);
incorrectInd = find(C ~= testClasses);

% plot(data(1, correctInd), data(2, correctInd), '.');
% hold on;
plot(data(1, incorrectInd), data(2, incorrectInd), 'ro');

axis equal
savefigure(mfilename);

confusionmat(testClasses, C)
