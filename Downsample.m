function z=Downsample(x,n)
%Downsample input data x by keeping every n-th sample starting with 
%the first.  The downsampling is done along the columns of x.
% This function is take x as vector/matrix, and the step size for the sampling
%(n) and return the new vector/matrix.

z=[];
for i=1:n:length(x)
    z=[z; x(i,:)];
end
end