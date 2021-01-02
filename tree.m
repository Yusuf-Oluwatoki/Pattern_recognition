%%
% QUESTION 1
%%
% With the Gini impurity as the split criterion, the decision tree
% classification gives an accuracy in the prediction of 97%.  
%And the node risk are given by  [0.666666666666666;0;0.333333333333333;...
% 0.0255999999999999;0.0255999999999999;0;0] for node 1 to 7. The tree has
% four leaves which classifies the data in to class 1 at node 2, class 2 at
% node 6, class 3 at node 7 and 5.

clear all
clc

load irisdata.mat

train=traindata';
label=trainclass';
test=data';
test_label=dataclass';

Tree=fitctree(train,label);
view(Tree,'Mode','graph')
gdi_risk=Tree.NodeRisk;
output=predict(Tree,test);
accuracy=100*length(find(output==test_label))/size(test,1)

%%
%With the deviance as the split criterion, the decision tree
% classification gives an accuracy in the prediction of 97%.  
%And the node risk are given by  [0.792481250360578;0;0.333333333333333;...
%0.0403820315137358; 0.0403820315137358;0;0] for node 1 to 7. The tree has
% four leaves which classifies the data in to class 1 at node 2, class 2 at
% node 6, class 3 at node 7 and 5.


% The obvious difference is in the node risk for the two method used.
% Possibily, with a more complex data, a structural difference can be
% acheived with the two different method.
%%
clear all
clc

load irisdata.mat

train=traindata';
label=trainclass';
test=data';
test_label=dataclass';

Tree=fitctree(train,label,'SplitCriterion','deviance');
view(Tree,'Mode','graph')
dev_risk=Tree.NodeRisk;
output=predict(Tree,test);
accuracy=100*length(find(output==test_label))/size(test,1)





%%




% QUESTION 2
%%
clear all
clc

load arrhythmia.mat


%creating random selection to divide the  data.
rng('default')
kk = randperm(round(size(X,1)));
k1=kk(1:360);
k2=kk(360:end);

% dividing the data  to test and train
train = X(k1(1:length(k1)),:);
train_label = Y (k1(1:length(k1)),:);

test = X(k2(1:length(k2)),:);  
test_label=Y (k2(1:length(k2)),:);

%fitting the decision tree model.
Tree=fitctree(train,train_label,'SplitCriterion','gdi');
view(Tree,'Mode','graph')

gdi_risk=Tree.NodeRisk;   %Using gini impurity as the measure of node risk
loss=cvloss(Tree);   %finding the cross validation loss
leaves=find(Tree.IsBranchNode'==0);  %Selecting the nodes that are leaves.
classes=Tree.NodeClass(leaves)';     %selecting the class of the nodes that are leaves.

output=predict(Tree,test);       %Predicting with the other part of the data
accuracy=100*length(find(output==test_label))/size(test,1)



%%
% Comparing the single decison tree with the random forest, I observe that
% the size of the sample as an influence of the accuracy of the model. Also
% resampling with different trees at a time does in a way improve the
% learning algorithim. Finally, aggregating the leaf  node class for the
% forest produces similar result as that of the single decision tree.
%%
clear all
clc

load arrhythmia.mat

for i=1:3
    %creating random selection to divide the  data.
    rng('default')
    kk = randperm(round(size(X,1)));
    pertition=[ 300 350 400];
    k1=kk(1:pertition(i));
    k2=kk(pertition(i):end);
    
    % dividing the data  to test and train
    train = X(k1(1:length(k1)),:);
    train_label = Y (k1(1:length(k1)),:);
    
    test = X(k2(1:length(k2)),:);
    test_label=Y (k2(1:length(k2)),:);
    
    
    %fitting the decision tree model.
    Tree=fitctree(train,train_label,'SplitCriterion','gdi');

    view(Tree,'Mode','graph');
    gdi_risk=Tree.NodeRisk;     %Using gini impurity as the measure of node risk
    loss(i)=cvloss(Tree);    %finding the cross validation loss
    leaves=find(Tree.IsBranchNode'==0);   %Selecting the nodes that are leaves.
    classes=Tree.NodeClass(leaves)';  %selecting the class of the nodes that are leaves.
    
    out=predict(Tree,test);  %Predicting with the other part of the data
    accuracy(i)=100*length(find(out==test_label))/size(test,1)
end

