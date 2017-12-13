y = [310 310 261 2837;278 281 272 2648;301 305 291 2667];	
x = [100 200 300];
h = bar(x,y,'FaceColor','flat');

text(73,y(1,1),num2str(y(1,1)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);
text(92,y(1,2),num2str(y(1,2)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);
text(110,y(1,3),num2str(y(1,3)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);
text(128,y(1,4),num2str(y(1,4)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);

text(173,y(2,1),num2str(y(2,1)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);
text(192,y(2,2),num2str(y(2,2)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);
text(210,y(2,3),num2str(y(2,3)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);
text(228,y(2,4),num2str(y(2,4)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);

text(273,y(3,1),num2str(y(3,1)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);
text(292,y(3,2),num2str(y(3,2)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);
text(310,y(3,3),num2str(y(3,3)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);
text(328,y(3,4),num2str(y(3,4)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);

xlabel('Density (veh/km^{2})','FontWeight','bold','FontSize',18);			
ylabel('Time (s)','FontWeight','bold','FontSize',18);	
l = legend('Decision','Non-Decision','Normal','Stop',2);
set(l,'FontWeight','bold','FontSize',15);
set(gca,'FontSize',16); 

set(h(1),'FaceColor',[0,0,0.54]);
set(h(2),'FaceColor',[0.54,0,0]);
set(h(3),'FaceColor',[0.8 0.4 0.22]);
set(h(4),'FaceColor',[0.18 0.54 0.34]);

title('Total Time','FontWeight','bold','FontSize',20);  
ylim([0 3500]);
set(gca,'ytick',(0:200:3500));



