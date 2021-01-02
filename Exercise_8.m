x1 = -3:0.2:3;
x2 = -3:0.2:3;
[X1,X2] = meshgrid(x1,x2);
X = [X1(:) X2(:)];
sigma = [2 0; 0 2]; mu1=[3 6]; mu2=[3 -2 ]; p1=1/2 ; p2=1-p1;
w1 = mvnpdf(X,mu1,sigma);
w2 = mvnpdf(X,mu2,sigma);
y1 = reshape(w1,length(x2),length(x1));
y2 = reshape(w2,length(x2),length(x1));

surf(x1,x2,y1)
caxis([min(y1(:))-0.5*range(y1(:)),max(y1(:))])
axis([-3 3 -3 3 0 0.4])
xlabel('x1')
ylabel('x2')
zlabel('Probability Density')

hold on
surf(x1,x2,y2)
caxis([min(y2(:))-0.5*range(y2(:)),max(y2(:))])
axis([-3 3 -3 3 0 0.4])
xlabel('x1')
ylabel('x2')
zlabel('Probability Density')

g=y1-y2;
hold on
surf(x1,x2,g)