%%


clear all
clc

load arrhythmia.mat

% Comparing the three random forest, I observe that
% the number of tree has an influence of the accuracy of the model. 
% However for this task, there was no signinicant improvement as the number
% of trees in the model increased.

%A more complicated an large data could make the improvement obvious.


%creating random selection to divide the  data.
rng('default')
kk = randperm(round(size(X,1)));
pertition=400;
k1=kk(1:pertition);
k2=kk(pertition:end);

% dividing the data  to test and train
train = X(k1(1:length(k1)),:);
train_label = Y (k1(1:length(k1)),:);

test = X(k2(1:length(k2)),:);
test_label=Y (k2(1:length(k2)),:);

    
    

%%
%fitting the random forest model
t = templateTree('MaxNumSplits',15);  % the node risk measure for the
%templateTree is the Gini impurity by default


%Random forest with 10 trees
Mdl0 = fitcensemble(train,train_label, 'Method','Bag','Learners',t,'NumLearningCycles' ,10);
output0=predict(Mdl0,test);
accuracy0=100*length(find(output0==test_label))/size(test,1)


%Random forest with 100 trees

Mdl00 = fitcensemble(train,train_label, 'Method','Bag','Learners',t);
output00=predict(Mdl00,test);
accuracy00=100*length(find(output00==test_label))/size(test,1)


%Random forest with 1000 trees

Mdl000 = fitcensemble(train,train_label, 'Method','Bag','Learners',t,'NumLearningCycles' ,1000);
output000=predict(Mdl000,test);
accuracy000=100*length(find(output000==test_label))/size(test,1)

