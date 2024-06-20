n=input("Enter 1 to start and 0 to exit: ");
while n
clf;
%Taking input
a = input("Enter normal stress on plane 1 horizontal axis: ");
b = input("Enter normal stress on plane 1 vertical axis: ");
c = input("Enter shear stress wrto horizontal: ");
%Calculating centre
x = (a + b)/2;
y = 0;
z = (a - b)/2;
% Subplot 1 - Mohr Circle
th = 0 : pi/100 : 2 * pi;
r = sqrt((a - b)^2 / 4 + c^2);
m = r*cos(th) + x;
n = r*sin(th) + y;
o = input("Enter the angle of rotation (in degrees) of horizontal plane 1: ");
D = -1*o;
subplot(2,2,1);
plot(m,n);
hold on;
plot(x,y,'r*'); % centre
% Function for drawing arrow
% Arrow showing original plane
drawArrow1 = @(x,y) quiver(x(1),y(1),x(2)-x(1),y(2)-y(1),0,'b','LineWidth',2);
x1 = [x a];
y1 = [y c];
drawArrow1(x1,y1);
% Showing Arrow of rotated plane
drawArrow2 = @(x,y) quiver(x(1),y(1),x(2)-x(1),y(2)-y(1),0,'g','LineWidth',2);
a1 = x + z*cosd(2*D) + c*sind(2*D);
b1 = x - z*cosd(2*D) - c*sind(2*D);
c1 = - z*sind(2*D) + c*cosd(2*D);
x2 = [x a1];
y2 = [y c1];
drawArrow2(x2,y2);
text(2*r, 0.5*r, ['\theta = ' num2str(2*D)], 'Color', 'k');
text(2.5*r,0.1*r,'Original Plane','Color','b');
text(2.5*r,-0.1*r,'Rotated Plane','Color','g');
axis equal;
grid on;
title('Mohr Circle');
xlabel('Normal stress \sigma');
ylabel('Shear Stress \tau');
%Stress acting on given plane
subplot(2,2,2);
sideLength = 1;
arrowLength = 0.5;
plot([0, sideLength, sideLength, 0, 0], [0, 0, sideLength, sideLength, 0], 'k', 'LineWidth', 1.5);
hold on;
% Add arrows
arrowStart = sideLength/2;
% Arrow perpendicular to the top side (Normal Stress)
if b>0
    quiver(arrowStart, sideLength, 0, arrowLength, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(arrowStart - 0.3, sideLength + 0.3, ['\sigma_y_y = ', num2str(b,'%.2f')], 'Color', 'r', 'HorizontalAlignment', 'center');
elseif b==0
else
    quiver(arrowStart, sideLength+arrowLength, 0,-arrowLength, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(arrowStart + 0.3, sideLength + 0.3, ['\sigma_y_y = ', num2str(-1*b,'%.2f')], 'Color', 'r', 'HorizontalAlignment', 'center');
end
% Arrow perpendicular to the bottom side (Normal Stress)
if b>0
    quiver(arrowStart, 0, 0, -arrowLength, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(arrowStart - 0.3, -0.3, ['\sigma_y_y = ', num2str(b,'%.2f')], 'Color', 'r', 'HorizontalAlignment', 'center');
elseif b==0
else
    quiver(arrowStart, -arrowLength, 0, arrowLength, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(arrowStart - 0.3, -0.3, ['\sigma_y_y = ', num2str(-1*b,'%.2f')], 'Color', 'r', 'HorizontalAlignment', 'center');
end
% Arrow perpendicular to the right side (Normal Stress)
if a>0
    quiver(sideLength, arrowStart, arrowLength, 0, 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(sideLength + 0.1, arrowStart+0.1, ['\sigma_x_x = ', num2str(a,'%.2f')], 'Color', 'b', 'HorizontalAlignment', 'left');
elseif a==0
else
    quiver(sideLength+arrowLength, arrowStart, -arrowLength, 0, 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(sideLength + 0.1, arrowStart+0.1, ['\sigma_x_x = ', num2str(-1*a,'%.2f')], 'Color', 'b', 'HorizontalAlignment', 'left');
end
% Arrow perpendicular to the left side (Normal Stress)
if a>0
    quiver(0, arrowStart, -arrowLength, 0, 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(-0.1, arrowStart-0.1, ['\sigma_x_x = ', num2str(a,'%.2f')], 'Color', 'b', 'HorizontalAlignment', 'right');
elseif a==0
else
    quiver(-arrowLength, arrowStart, arrowLength, 0, 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(-0.1, arrowStart-0.1, ['\sigma_x_x = ', num2str(-1*a,'%.2f')], 'Color', 'b', 'HorizontalAlignment', 'right');
end
% Arrow along the top side (Shear Stress)
if c<0
    quiver(arrowStart, sideLength, arrowLength, 0, 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(arrowStart + 0.6, sideLength+0.1, ['\tau_x_y = ', num2str(-1*c,'%.2f')], 'Color', 'g', 'HorizontalAlignment', 'right');
elseif c==0
else
    quiver(arrowStart, sideLength, -arrowLength, 0, 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(arrowStart - 0.3, sideLength+0.1, ['\tau_x_y = ', num2str(c,'%.2f')], 'Color', 'g', 'HorizontalAlignment', 'right');
end

% Arrow along the bottom side (Shear Stress)
if c<0
    quiver(arrowStart, 0, -arrowLength, 0, 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(arrowStart - 0.6, -0.1, ['\tau_x_y = ', num2str(-1*c,'%.2f')], 'Color', 'g', 'HorizontalAlignment', 'left');
elseif c==0
else
    quiver(arrowStart, 0, arrowLength, 0, 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(arrowStart + 0.3, -0.1, ['\tau_x_y = ', num2str(c,'%.2f')], 'Color', 'g', 'HorizontalAlignment', 'left');
end

% Arrow along the right side (Shear Stress)
if c>0
    quiver(sideLength, arrowStart, 0, -arrowLength, 'm', 'LineWidth', 2, 'MaxHeadSize', 0.5);   
    text(sideLength+0.3, arrowStart - 0.2, ['\tau_x_y = ', num2str(c,'%.2f')], 'Color', 'm', 'HorizontalAlignment', 'center');
elseif c==0
else
    quiver(sideLength, arrowStart, 0, arrowLength, 'm', 'LineWidth', 2, 'MaxHeadSize', 0.5);   
    text(sideLength+0.3, arrowStart + 0.3, ['\tau_x_y = ', num2str(-1*c,'%.2f')], 'Color', 'm', 'HorizontalAlignment', 'center');
end
% Arrow along the left side (Shear Stress)
if c>0
    quiver(0, arrowStart, 0, arrowLength, 'm', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(-0.3, arrowStart + 0.3, ['\tau_x_y = ', num2str(c,'%.2f')], 'Color', 'm', 'HorizontalAlignment', 'center');
elseif c==0
else
    quiver(0, arrowStart, 0, -arrowLength, 'm', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(-0.3, arrowStart - 0.3, ['\tau_x_y = ', num2str(-1*c,'%.2f')], 'Color', 'm', 'HorizontalAlignment', 'center');
end
% Title
title('Stresses on Given Plane');

axis equal;
% Show the plot
hold on;
% Stress on Rotated Plane
subplot(2,2,4);
sideLength = 1;
arrowLength = 0.4;
plot([0, sideLength, sideLength, 0, 0], [0, 0, sideLength, sideLength, 0], 'k', 'LineWidth', 1.5);
hold on;

% Add arrows
arrowStart = sideLength/2;

% Arrow perpendicular to the top side (Normal Stress)
if b1>0
    quiver(arrowStart, sideLength, 0, arrowLength, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(arrowStart - 0.3, sideLength + 0.3, sprintf('\\sigma_{y''y''} = %.2f', b1), 'Color', 'r', 'HorizontalAlignment', 'center');
elseif b1==0
else
   quiver(arrowStart, sideLength+arrowLength, 0,-arrowLength, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5);
   text(arrowStart + 0.3, sideLength + 0.3, sprintf('\\sigma_{y''y''} = %.2f', -b1), 'Color', 'r', 'HorizontalAlignment', 'center'); 
end
% Arrow perpendicular to the bottom side (Normal Stress)
if b1>0
    quiver(arrowStart, 0, 0, -arrowLength, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(arrowStart - 0.3, -0.3, sprintf('\\sigma_{y''y''} = %.2f', b1), 'Color', 'r', 'HorizontalAlignment', 'center');
elseif b1==0
else
    quiver(arrowStart, -arrowLength, 0, arrowLength, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(arrowStart - 0.3, -0.3, sprintf('\\sigma_{y''y''} = %.2f', -b1), 'Color', 'r', 'HorizontalAlignment', 'center');
end
% Arrow parpendicular to the right side (Normal Stress)
if a1>0
    quiver(sideLength, arrowStart, arrowLength, 0, 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(sideLength + 0.1, arrowStart+0.1,sprintf('\\sigma_{x''x''} = %.2f', a1), 'Color', 'b', 'HorizontalAlignment', 'left');
elseif a1==0
else
    quiver(sideLength+arrowLength, arrowStart, -arrowLength, 0, 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(sideLength + 0.1, arrowStart+0.1, sprintf('\\sigma_{x''x''} = %.2f', -a1), 'Color', 'b', 'HorizontalAlignment', 'left');
end
% Arrow perpendicular to the left side (Normal Stress)
if a1>0
    quiver(0, arrowStart, -arrowLength, 0, 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(-0.1, arrowStart-0.1, sprintf('\\sigma_{x''x''} = %.2f', a1), 'Color', 'b', 'HorizontalAlignment', 'right');
elseif a1==0
else
    quiver(-arrowLength, arrowStart, arrowLength, 0, 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(-0.1, arrowStart-0.1, sprintf('\\sigma_{x''x''} = %.2f', -a1), 'Color', 'b', 'HorizontalAlignment', 'right');
end
% Arrow along the top side (Shear Stress)
if c1<0
    quiver(arrowStart, sideLength, arrowLength, 0, 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(arrowStart + 0.5, sideLength+0.1, sprintf('\\tau_{x''y''} = %.2f', -c1), 'Color', 'g', 'HorizontalAlignment', 'right');
elseif c1==0
else
    quiver(arrowStart, sideLength, -arrowLength, 0, 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(arrowStart - 0.3, sideLength+0.1, sprintf('\\tau_{x''y''} = %.2f', c1), 'Color', 'g', 'HorizontalAlignment', 'right');
end
% Arrow along the bottom side (Shear Stress)
if c1<0
    quiver(arrowStart, 0, -arrowLength, 0, 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(arrowStart - 0.5, -0.1, sprintf('\\tau_{x''y''} = %.2f', -c1), 'Color', 'g', 'HorizontalAlignment', 'left');
elseif c1==0
else
    quiver(arrowStart, 0, arrowLength, 0, 'g', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(arrowStart + 0.3, -0.1, sprintf('\\tau_{x''y''} = %.2f', c1), 'Color', 'g', 'HorizontalAlignment', 'left');
end
% Arrow along the right side (Shear Stress)
if c1>0
    quiver(sideLength, arrowStart, 0, -arrowLength, 'm', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(sideLength+0.3, arrowStart - 0.3, sprintf('\\tau_{x''y''} = %.2f', c1), 'Color', 'm', 'HorizontalAlignment', 'center');
elseif c1==0
else
    quiver(sideLength, arrowStart, 0, arrowLength, 'm', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(sideLength+0.3, arrowStart + 0.3, sprintf('\\tau_{x''y''} = %.2f', -c1), 'Color', 'm', 'HorizontalAlignment', 'center');
end
% Arrow along the left side (Shear Stress)
if c1>0
    quiver(0, arrowStart, 0, arrowLength, 'm', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(-0.3, arrowStart + 0.3, sprintf('\\tau_{x''y''} = %.2f', c1), 'Color', 'm', 'HorizontalAlignment', 'center');
elseif c1==0
else
    quiver(0, arrowStart, 0, -arrowLength, 'm', 'LineWidth', 2, 'MaxHeadSize', 0.5);
    text(-0.3, arrowStart - 0.3, sprintf('\\tau_{x''y''} = %.2f', -c1), 'Color', 'm', 'HorizontalAlignment', 'center');
end
% Add labels and title
title(['Stresses on Rotated Plane \theta = ' num2str(o) '^\circ']);

% Set axis limits
axis equal;

% Show the plot
hold on;

% Adjust the layout
sgtitle('Mohr Circle and Planes');
n=input("Enter 1 to continue and 0 to exit: ");
end