clear all
clc

%%
load irisdata.mat

data1=data'
[centers,U] = fcm(data1,3);

%%

maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
index3 = find(U(3,:) == maxU);
plot(data1(index1,1),data1(index1,2),'ob')
hold on
plot(data1(index2,1),data1(index2,2),'or')
hold on
plot(data1(index3,1),data1(index3,2),'og')
plot(centers(1,1),centers(1,2),'xb','MarkerSize',15,'LineWidth',3)
plot(centers(2,1),centers(2,2),'xr','MarkerSize',15,'LineWidth',3)
plot(centers(3,1),centers(3,2),'xg','MarkerSize',15,'LineWidth',3)
title('F C-Means cluster on the data with NC=3')
hold off



%%
[IDX, C] = kmeans(traindata', 3)


%%

figure

hold on
plot(traindata(1, trainclass==1), traindata(2, trainclass==1), 'r*');
hold on
plot(traindata(1, trainclass==2), traindata(2, trainclass==2), 'g*');
hold on
plot(traindata(1, trainclass==3), traindata(2, trainclass==3), 'b*');

legend('Class 1', 'Class 2', 'Class 3')
title('Iris data with it classes')


figure
plot(traindata(1, IDX==1), traindata(2, IDX==1), 'r*');
hold on
plot(traindata(1, IDX==2), traindata(2, IDX==2), 'g*');
hold on
plot(traindata(1, IDX==3), traindata(2, IDX==3), 'b*');

legend('Class 1', 'Class 2', 'Class 3')
title('K-Means cluster on the data with k=3')
%%
%K=3

%The experimentation with the data gives the same result for the fcm with
%the same Nc iterations. While the Kmeans gives different results at
%different iteration. The 


%%
%CASE 2

%%
data1=data'
[centers,U] = fcm(data1,2);

%%

maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
plot(data1(index1,1),data1(index1,2),'ob')
hold on
plot(data1(index2,1),data1(index2,2),'or')

plot(centers(1,1),centers(1,2),'xb','MarkerSize',15,'LineWidth',3)
plot(centers(2,1),centers(2,2),'xr','MarkerSize',15,'LineWidth',3)

title('F C-Means cluster on the data with NC=2')
hold off



%%
[IDX, C] = kmeans(traindata', 2)


%%

figure

hold on
plot(traindata(1, trainclass==1), traindata(2, trainclass==1), 'r*');
hold on
plot(traindata(1, trainclass==2), traindata(2, trainclass==2), 'g*');

legend('Class 1', 'Class 2')
title('Iris data with it classes')


figure
plot(traindata(1, IDX==1), traindata(2, IDX==1), 'r*');
hold on
plot(traindata(1, IDX==2), traindata(2, IDX==2), 'g*');


legend('Class 1', 'Class 2')
title('K-Means cluster on the data with k=2')
%%

%The experimentation with the data gives the same result for the fcm with
%the same Nc iterations. While the Kmeans gives different results at
%different iteration. The appropriate with minimal between cluster error in the data is 2.


