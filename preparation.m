
function [Data, Y]=preparation(data)
%Data preparation
%Step 1:-
%Find the length of each file in the data

 for k = 1:numel(data)
     len(k)=ETL(data(k).pos); 
 end

% Step 2:-
% use pca to reduce the dimension of the sample or to find which axis 
% represents the sample well.
for j =1: length(data)
    [COEFF, SCORE, LATENT, TSQUARED, EXPLAINED(:,j)] = pca(data(j).pos);
end

% Take only the first 16 data sample, and use pca to plot the explained for
% those sample.
sample_pca=randi(1000,1,16);
figure
for j=1:length(sample_pca)
    subplot(4, 4, j)
    [COEFF1, SCORE1, LATENT1, TSQUARED1, EXPLAINED1(:,j)] = pca(data(sample_pca(j)).pos);
    plot(EXPLAINED1(:,j), '.-')
    xlabel('Features')
    ylabel('Percentage variance')
    title('Explained variance of observation')
 end

%Step 3:-
% We find the maximum size of our samples, to put all the other samples as
% this size by using interpolation mathod.

DD=[]; %empty matrix for the the data samples.
for i=1:length(data)
    for j=1:2
        n=length(data(i).pos(:,j));
        m=max(len)+18;
        posdata(:,j) = interp1(linspace(min(data(i).pos(:,j)),max(data(i).pos(:,j)),n),data(i).pos(:,j),...
            linspace(min(data(i).pos(:,j)),max(data(i).pos(:,j)),m))';
    end
    DD=[DD posdata];
    
end
% Step 4:-
%Now we want to reduce the size of our DD matrix, by using downsample to be
%only 24 points for each axis.

samples=downsample(DD,10);

%Step 5:- 
% Put the both axis (x and y) of any sample as one column.

DDD=[];
for i=1:2:1999  
  DDD=[DDD ;samples(:,i)' samples(:,i+1)'];  
end
Data=DDD';

%Step 6:- 
% The label of each column (sample) as Y column vector.

Y(1:100)=0;Y(101:200)=1;Y(201:300)=2;Y(301:400)=3;Y(401:500)=4;Y(501:600)=5;
Y(601:700)=6;Y(701:800)=7;Y(801:900)=8; Y(901:1000)=9;

%Put the all data as the train and test and Y as the train_label and
%test_label

end
