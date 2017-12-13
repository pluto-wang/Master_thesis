y = [10659 1664;12590 1396;13440 1542];
x = [100 200 300];
bar(x,y);  

text(85,y(1,1),num2str(y(1,1)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);
text(115,y(1,2),num2str(y(1,2)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);

text(185,y(2,1),num2str(y(2,1)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);
text(215,y(2,2),num2str(y(2,2)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);

text(287,y(3,1),num2str(y(3,1)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);
text(315,y(3,2),num2str(y(3,2)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontWeight','bold','FontSize',16);

xlabel('Density (veh/km^{2})','FontWeight','bold','FontSize',18);			
ylabel('Broadcast Overhead (pkts)','FontWeight','bold','FontSize',18);	
l = legend('Decision','Non-Decision',2);
set(l,'FontWeight','bold','FontSize',15);
set(gca,'FontSize',16); 
title('Broadcast Overhead','FontWeight','bold','FontSize',20);
ylim([0 15000]);
set(gca,'ytick',(0:1000:15000));


