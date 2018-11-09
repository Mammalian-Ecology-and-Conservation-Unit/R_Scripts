library(ggplot2)
library(reshape2)
# Copy the Q values output from Structure into file_generic.txt. In this case consider 2 populations (K=2; hence only using 2 colors)

STR = read.table("file_generic.txt", header=TRUE) 
STR.m = melt(STR, id.var="ID") #Melt the data into 3-col format for ggplot. Package: reshape2
stru = ggplot(STR.m, aes(x = ID, y = value, fill = variable, width = 1, ymax=1.0, ymin=0.0)) + #Set your x and y values and the fill determines groups. width = # is the width of the bar (from 0 to 1, the latter has no spacing)
	geom_bar(stat = "identity", colour = "white") + #colour="white" makes the sep. lines between bars white
	scale_fill_manual(values=c("dodgerblue1", "firebrick1")) +  #Sets the colours (assigned by fill = variable above)
	coord_cartesian(ylim = c(-0.1,1)) + #Set your Y limit to be bound 0-1
	ylab("Probability of assignment\n") + #added newline char to increase space between label
	theme(axis.title.y = element_text(color="black", size=35, face="bold", vjust=0)) +
	theme(axis.title.x = element_text(color="black", size=40, face="bold")) +
	theme(axis.text.y = element_text(color="black", size=20)) +
	xlab("Individuals") +
	theme(axis.text.x = element_blank()) +
	theme(axis.ticks.x = element_blank()) +
	theme(panel.background = element_blank())
