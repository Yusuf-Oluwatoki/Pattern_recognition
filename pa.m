clear all
close all
clc
%% 
load param_est_data.mat
n=[1, 10, 100, 1000]; % vector of the four sample sizes to be used
for i= 1:length(n)
    Sigma=[1 0; 0 1]; Sigma_0=[0.1 0; 0 0.1]; mu_0=[1; 2]; % The given covariance and mean
    mu= [(1/n(i)).*sum(data(1,1:n(i))); (1/n(i)).*sum(data(2,1:n(i)))]; 
    % Getting the mean for the samples by number of rows
    mu_B= Sigma_0*inv(Sigma_0+((1/n(i)).*Sigma))*mu...
        +(1/n(i)).*Sigma*inv(Sigma_0+(1/n(i)).*Sigma)*mu_0
    %Bayesian estimate for the mean
    Sigma_B1= Sigma_0*inv(Sigma_0+(1/(n(i))).*Sigma)*Sigma.*(1/(n(i)));
    %Bayesian baised estimate for the covariance
    
    Sigma_B= Sigma_0*inv(Sigma_0+(1/(n(i)-1)).*Sigma)*Sigma.*(1/(n(i)-1))
    %Bayesian baised estimate for the covariance


end

%%
%The estimated mean moved rapidly from [0.9549 2.1488] to [0.8859 1.7398] 
%then [1.1637 1.8532] and finally [1.1261 1.8674] with some
%variation as the number of sample size increased. 

%Similarly the estimated covariance for the baised estimator change rapidly from [0.0909 0; 0 0.0909] 
% to [0.0500 0; 0 0.0500] then [0.0091 0; 0 0.0091] and finally [0.000099 0; 0 0.000099] 
% as the number of sample size increased. These are all cases of equal
% variance and no covariance.

%While the estimated covariance for the unbaised estimator change rapidly from [- -; - -] 
% to [0.0526 0; 0 0.0526] then [0.0092 0; 0 0.0092] and finally [0.00009911 0; 0 0.00009911] 
% as the number of sample size increased. These are all cases of equal
% variance and no covariance.

%The formula used was the mle function in matlab which estimates
%the mean and variance of the normal distribution.