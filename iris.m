close all
clear all
clc

load iris
load setosa_thetaval
load Versicolor_thetaval
load Virginica_thetaval

Xt1 = meas(41:50, 1:4);
Xt2 = meas(91:100, 1:4);
Xt3 = meas(141:150, 1:4);
Xt = [Xt1; Xt2; Xt3];
[m n] = size(Xt);
Xtest = zeros(m,2);
for i = 1:m
    Xtest(i,:) = [mean(Xt(i,:)) var(Xt(i,:))];
end 

Xtest = [ones(m, 1) Xtest];

y1 = meas(41:50, 5);
y2 = meas(91:100, 5);
y3 = meas(141:150, 5);
y = [y1; y2; y3];

plotClass(Xtest(:,2:3)',y');

hold on

plot_x = [min(Xtest(:,2))-2,  max(Xtest(:,2))+2];

% Calculate the decision boundary line
plot_y1 = (-1./theta1(3)).*(theta1(2).*plot_x + theta1(1));

% Plot, and adjust axes for better viewing
plot(plot_x, plot_y1,'b')

hold on

% Calculate the decision boundary line
plot_y2 = (-1./theta2(3)).*(theta2(2).*plot_x + theta2(1));

% Plot, and adjust axes for better viewing
plot(plot_x, plot_y2,'r')

hold on

% Calculate the decision boundary line
plot_y3 = (-1./theta3(3)).*(theta3(2).*plot_x + theta3(1));

% Plot, and adjust axes for better viewing
plot(plot_x, plot_y3,'g')

hold off
grid off
legend('Setosa','Versicolor','Virginica')
axis([0 5 2 6]);

prediction1 = 1./(1+exp(Xtest*theta1));
prediction2 = 1./(1+exp(Xtest*theta2));
prediction3 = 1./(1+exp(Xtest*theta3));

prediction = zeros(m,1);
for i = 1:m
    if prediction1(i,:)>=prediction2(i,:) && prediction1(i,:)>=prediction3(i,:)
        prediction(i,:) = 1;
    elseif prediction2(i,:)>=prediction1(i,:) && prediction2(i,:)>=prediction3(i,:)
        prediction(i,:) = 2;
    else
        prediction(i,:) = 3;
    end
end

C = confusionmat(y,prediction);
precision1 = C(1,1)/sum(C(:,1));
precision2 = C(2,2)/sum(C(:,2));
precision3 = C(3,3)/sum(C(:,3));
recall1 = C(1,1)/sum(C(1,:));
recall2 = C(2,2)/sum(C(2,:));
recall3 = C(3,3)/sum(C(3,:));
fmeas1 = 2*(precision1*recall1)/(precision1 + recall1);
fmeas2 = 2*(precision2*recall2)/(precision2 + recall2);
fmeas3 = 2*(precision3*recall3)/(precision3 + recall3);

disp('Precision and Recall for class 1 are:'); disp(precision1);disp(recall1);
disp('Precision and Recall for class 2 are:'); disp(precision2); disp(recall2);
disp('Precision and Recall for class 3 are:'); disp(precision3); disp(recall3);
disp('F measure for class 1 is:'); disp(fmeas1);
disp('F measure for class 2 is:'); disp(fmeas2);
disp('F measure for class 3 is:'); disp(fmeas3);

Acc = sum(diag(C))/sum(C(:));
disp('Accuracy of the system is:');disp(Acc)
