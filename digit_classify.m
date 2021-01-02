
function C=digit_classify(testdata)
%step 1:-
%prepare the testdata to  be the same size of our data
data_prep=prep_tast(testdata);

%step 2:-
%prepare all the data file and use it as train data and train label for our
%classifer function

%put all the data in one struct file, contains all the samples of each digit in the traindata folder.
files = dir('traindata/*.mat') 
for k = 1:numel(files)
    data(:,k) = load(files(k).name); 
end
[Data, Y]=preparation(data);

%Step 3:-
%use Knn function to predicted the label of our train data for different
% number of k, and take the one which gives us the best accuracy.

K=1:5;
for i=K
    %Cross-validation of each K. To get the K with the minimum error.
    for j=1:10
        [train, train_label, test, test_label]= split_data(Data, Y);
        [predicted(:,j),accuracy(j)] = Knn(i,train', train_label', test',test_label');
        errorr(j)= (100-accuracy(j))/100;
    end
    val_acc(:,i)=accuracy;
    Er(i)=mean(errorr);
end
    T=K(find(Er==min(Er))); %the best K from the knn function.



%Step 4:-
%use predict_data function to predicted the label of the testdata. 
C = predict_data(T,train', train_label', data_prep');
end

