load bayes1data.mat
plotclass(mu,Sigma);
plot(data(1,:), data(2,:), '.');
plot(data(1, classes==1), data(2, classes==1), 'r*');
%plot_gaussian_ellipsoid();

function C=bayes(mu, Sigma,data)
c= size(mu,2);
n= size(data,2);
D= zeros(c,n);
for i=1:c
    W= -0.5*inv(Sigma(:,:i));
    w= inv(sigma(:,:i))*mu(i);
    w0=  -0.5*(mu(i))'.*(Sigma(i)).*(mu(i))-0.5*log(det(Sigma(i)));

    for j =1:n
        D(i,j)= data'*W*data+w'*data+w0;
    
    end
end
[~, C]=max(D);

end
