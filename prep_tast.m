
function data=prep_tast(testdata)

% To prepare the data to be as the same size of the training data 
% use pca to reduce the dimension of the sample or to find which axis 
% represents the sample well.

[COEFF, SCORE, LATENT, TSQUARED, EXPLAINED] = pca(testdata);
% if sum(EXPLAINED(1:2))>90
    testdata=testdata(:,1:2);
% end

[n nn]=size(testdata);
for j=1:nn
    m=240;
    posdata(:,j) = interp1(linspace(min(testdata(:,j)),max(testdata(:,j)),n),testdata(:,j),...
        linspace(min(testdata(:,j)),max(testdata(:,j)),m))';
end


%To reduce the size of our postdata, by using Downsample to be
%only 24 points for each axis.

samples=Downsample(posdata,10);
data=[];
for i=1:nn
data=[data ;samples(:,i)];
end

end