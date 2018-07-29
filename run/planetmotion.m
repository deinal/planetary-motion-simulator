clear; 
planets = dlmread('plot.dat');

n=9;

x=planets(:,1);
y=planets(:,2);
z=planets(:,3);


plot3(x(1:n:end),y(1:n:end),z(1:n:end));
set(gca,'Color','k')
hold on
for i=1:n
  plot3(x(i:n:end),y(i:n:end),z(i:n:end));
end
hold off