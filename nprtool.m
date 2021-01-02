%%

%With the neural network tool, a network of three hidden layers and varying number
%of neuron per layer was experimented. It was seen that the performance of
%the model depends on both the number of hideen layers and number of node
%in each layer. Overall, with very large hidden layers, the performance of
%the network increase at both the train and test lavel, but fails in
%generalization (performs relatively poor on the validation stage). It was
%also seen that the network can not model excellently in the three stages
%(train, test and validation). Hence an acceptable level of
%misclassification can be tolorated to avoid the network from overlearning
%the data.

%Three cases were tested (data1, data3 and irisdata)

%%
clear all
clc

load data1.mat
data=data1;
t1=zeros(size(data1));
t1(1,class1==1)=1;
t1(2,class1==2)=1;
net= patternnet([5,5,5]);
[net,tr]=train(net,data,t1);
view(net);
y=net(data);
perf=perform(net,t1,y);
classes= vec2ind(y);
e = gsubtract(t1,y);
percentErrors = sum(t1 ~= classes)/numel(t1);


% Plots
figure, plotperform(tr)
figure, plottrainstate(tr)
figure, ploterrhist(e)
figure, plotconfusion(t1,y)

%%
clear all
clc

load data3.mat
data=data3;
t1=zeros(size(data3));
t1(1,class3==1)=1;
t1(2,class3==2)=1;
net= patternnet([5,5,5, 5]);
[net,tr]=train(net,data,t1);
view(net);
y=net(data);
perf=perform(net,t1,y);
classes= vec2ind(y);
e = gsubtract(t1,y);
percentErrors = sum(t1 ~= classes)/numel(t1);


% Plots
figure, plotperform(tr)
figure, plottrainstate(tr)
figure, ploterrhist(e)
figure, plotconfusion(t1,y)


%%
clear all
clc

[x,t]=iris_dataset; 
net= patternnet([30, 20, 10]);
[net,tr]=train(net,x,t);
view(net);
y=net(x);
perf=perform(net,t,y);
e = gsubtract(t,y);
classes= vec2ind(y);
percentErrors = sum(t ~= classes)/numel(t);

% Plots
figure, plotperform(tr)
figure, plottrainstate(tr)
figure, ploterrhist(e)
figure, plotconfusion(t,y)
