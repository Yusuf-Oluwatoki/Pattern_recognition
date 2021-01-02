function [train, train_label, test, test_label]= split_data(Data, Y)
% Split the data into train and test with corresponding label values.

%rng('shuffle')
kk = randperm(round(size(Data,2)));
k1=kk(1:800);
k2=kk(801:end);


train = Data(:,k1(:,1:length(k1)));
train_label = Y(:,k1(:,1:length(k1)));

test = Data(:,k2(:,1:length(k2)));
test_label=Y(:,k2(:,1:length(k2)));
end
