function plotdata(x,y)
  figure; hold on;
  one = find(y==1); two= find(y==2); three = find(y==3);
  plot(x(one,1), x(one,2), 'k+','LineWidth', 2, 'MarkerSize', 5);
  plot(x(two,1), x(two,2), 'ko','MarkerFaceColor', 'y','MarkerSize', 5);
  plot(x(three,1), x(three,2), 'k*','MarkerFaceColor', 'y', 'MarkerSize', 5);
  
  hold off;
  end
  
