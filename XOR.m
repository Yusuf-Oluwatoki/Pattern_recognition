input = [0 0 1; 0 1 1; 1 0 1; 1 1 1] % input vector
num_in = 4; % number of samples
desired_out = [0;1;1;0] % desired output
w=rand(3,1); % weight vector, initially zero
iterations = 100; % number of iterations to go through

for i = 1:iterations
   out = zeros(4,1);
   for j = 1:num_in % go per row of x
      y = input(j,1)*w(1,1)+input(j,2)*w(2,1)+w(3,1); % sum
      out(j,1) = y>0;
      w(1,1) =w(1,1)+input(j,1)*(desired_out(j,1)-out(j,1));
      w(2,1) = w(2,1)+input(j,2)*(desired_out(j,1)-out(j,1));
      w(3,1) = w(3,1)+input(j,3)*(desired_out(j,1)-out(j,1));
   end
end
out %print the output


% Initialization
    xmax = max(input( :,1)) + 1;
    xmin = min(input(:,1)) - 1;
    ymax = max(input(:,2)) + 1;
    ymin = min(input(:,2)) - 1;
...
% Plot data and discriminant
    hold off;
    plot(input(desired_out==1,1), input(desired_out==1,2), 'bx');
    hold on
    plot(input(desired_out==0,1), input(desired_out==0,2), 'ro');
    axis([xmin xmax ymin ymax]);
    hold on;
    line([xmin xmax], [-(w(1,1) * xmin + w(3,1)) / w(2,1), ...
    -(w(1,1) * xmax + w(3,1)) / w(2,1)]);
    pause(0.1);  