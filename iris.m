clear; close all; clc

data = load('iris.txt');

X= data(:,1:4);
x= data(:,1:2);
y= data(:,5);
fprintf("loading the dataset");
m = size(X,1);
n = size(X,2);

lambda = .3;
theta= zeros(4,1);
fprintf(['Plotting data with + indicating (y = 1) examples , o ' ...
         'indicating (y = 2) examples and d indicating (y=3)\n']);
plotdata(x,y);
hold on;
xlabel('sepal length');
ylabel('sepal width');
legend('Iris-Setosa', 'Iris-Versicolor', 'Iris-Virginica');
hold off;
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

 
 X = [ones(m, 1) X];
 theta=zeros(5,1);
 [J grad]=costfunction(theta,X,y,lambda);
 
 fprintf("cost= %f\n",J);
 fprintf("grad= %f\n",grad);
 
 fprintf('Program paused. Press enter to continue.\n');
 
  
