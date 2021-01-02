%%


clear all
clc
load t103.mat

w=lms(data,class)


% Initialization
    xmax = max(data(1, :)) + 1;
    xmin = min(data(1, :)) - 1;
    ymax = max(data(2, :)) + 1;
    ymin = min(data(2, :)) - 1;
...
% Plot data and discriminant
    hold off;
    plot(data(1, class==1), data(2, class==1), 'bx');
    hold on
    plot(data(1, class==2), data(2, class==2), 'ro');
    axis([xmin xmax ymin ymax]);
    hold on;
    line([xmin xmax], [(w(1) * xmin + w(3)) / w(2), ...
    (w(1) * xmax + w(3)) / w(2)]);
%%
function w=lms(data1,class1)

% data1  is a 2 by 42 matrix
% class1 is a 1 by 42 vector
%w as col vector
n = length(data1);
w = (rand(3, 1)-0.5)./10;

%Extended weight vector
%w= [w' 1]';

%Extended data matrix
data1=[data1; ones(1,n)];

%Number of iterations versus error
class1(class1==2)=-1;

%norm1=10e4;
eps=10e-6;
w1=rand(length(w),1);
stop=0;
while (norm(w./norm(w)-w1./norm(w1))>eps & stop)
    w1=w;
    
    %ycomp=[];
    
    for i=1:size(data1,1)
        rho=0.5/i;
        i=i+1;
        %ycomp(i)=sign(w'*data(:,i));
        %r(i)=sqrt(sum((class1(i)-ycomp(i))^.05;
        %w = w-rho*r(i)*data(:,i);
        w = w-rho*data1'*(data1*w-class1);
    end
    if i==1e5
        stop=1;
    end
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
    line([xmin xmax], [-(w(1) * xmin + w(3)) / w(2), ...
    -(w(1) * xmax + w(3)) / w(2)]);
    pause(0.1);  
end
  
end