
function [predicted] = predict_data(K,traindata, trainclass,data)

% The function takes in the data and the corresponding classes
% then a K value for finding the euclidean distance between the points.
% This distance is then compared with the class with the highest number of
% k. The accuracy is measured as the percentage count of the number
% of similar class of the test and train data.

L= length(trainclass);
Uc= unique(trainclass);
N= size(data,1);
predicted= zeros(N,1);

for i = 1:N
    dist= sum((traindata - ones(L,1)*data(i,:)).^2,2);
    [m, indices]= sort(dist);
    n = hist(trainclass(indices(1:K)), Uc);
    [m, best]= max(n);
    predicted(i)= Uc(best);
end


end