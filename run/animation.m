planets = dlmread('plot.dat');

n=9;

x=planets(:,1);
y=planets(:,2);
z=planets(:,3);

plot3(x(1),y(1),z(1));
s=12;     %11,   12
a=5;      %8,    5
b=2;      %5,    2
c=3;      %5,    3
t=1e-10;  %0.1,  1e-10
for k = 1:n:length(x);
    plot3(x(k),y(k),z(k),'or','MarkerSize',b,'MarkerFaceColor','y');
    set(gca,'Color','k')
    axis([-a*10^(s) a*10^(s) -a*10^(s) a*10^(s) -a*10^(11) a*10^(11)])
    hold on
    plot3(x(k+1),y(k+1),z(k+1),'or','MarkerSize',b,'MarkerFaceColor','m');
    plot3(x(k+2),y(k+2),z(k+2),'or','MarkerSize',b,'MarkerFaceColor','g');
    plot3(x(k+3),y(k+3),z(k+3),'or','MarkerSize',b,'MarkerFaceColor','b');
    plot3(x(k+4),y(k+4),z(k+4),'or','MarkerSize',b,'MarkerFaceColor','r');
    plot3(x(k+5),y(k+5),z(k+5),'or','MarkerSize',c,'MarkerFaceColor','y');
    plot3(x(k+6),y(k+6),z(k+6),'or','MarkerSize',c,'MarkerFaceColor','m');
    plot3(x(k+7),y(k+7),z(k+7),'or','MarkerSize',c,'MarkerFaceColor','b');
    plot3(x(k+8),y(k+8),z(k+8),'or','MarkerSize',c,'MarkerFaceColor','c');
    hold off
    pause(t)
end

