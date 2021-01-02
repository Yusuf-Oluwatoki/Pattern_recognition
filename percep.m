
clear all
clc
load data1.mat

w=perceps(data1,class1)

%%
clear all
clc
load data2.mat

w=perceps(data2,class2)
%%

clear all
clc
load data3.mat

w=perceps(data3,class3)

%%
function w=perceps(data1,class1)

% data1  is a 2 by 42 matrix
% class1 is a 1 by 42 vector
%w as col vector
n = length(data1);
w = rand(size(data1, 1), 1);

%Extended weight vector
w= [w' 1]';

%Extended data matrix
data=[data1; ones(1,n)];

%Number of iterations versus error
norm1=10e4; tol=10e-5;
while (norm1>tol)
    w1=w;
    
    for i=1:size(data,1)
        rho=0.08/i;
        y(i)=sign(w'*data(:,i));
        error(i)=class1(i)-y(i);
        w = w+rho*error(i)*data(:,i);
    end
    norm1=norm(w1-w);
    % Initialization
    xmax = max(data1(1, :)) + 1;
    xmin = min(data1(1, :)) - 1;
    ymax = max(data1(2, :)) + 1;
    ymin = min(data1(2, :)) - 1;
...
% Plot data and discriminant
    hold off;
    plot(data1(1, class1==1), data1(2, class1==1), 'bx');
    hold on
    plot(data1(1, class1==2), data1(2, class1==2), 'ro');
    axis([xmin xmax ymin ymax]);
    hold on;
    line([xmin xmax], [(w(1) * xmin + w(3)) / w(2), ...
    (w(1) * xmax + w(3)) / w(2)]);
    pause(0.1);  
end
  
end