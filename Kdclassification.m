load irisdata.mat
s=5;
function C=kdclassification(trainclass, traindata,data,s)

classes=max(trainclss);
[d,n]= size(traindata);
Ntest=size(data,2);
p= zeros(classes, Ntest);
for j= 1:classes
    traindatak= traindata(:, trainclass==k);
    px = makedist('Normal');
    for l=1:size(traindatak,2)
        p(k,j)=p(k,j)+1/(s^d)/n*px*((traindata-data)./s);
    end
end
[foo, C]=max(p);
C(foo==0)=0;
    
end