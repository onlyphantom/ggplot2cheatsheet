## ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ##
# Everything you can do with theme()
## ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ##

### Note margin=c(T,R,B,L) in ggplot2. Use vjust to move title away
g + theme(plot.title = element_text(size=20, face=bold, margin=c(20,0,0,20), lineheight=.8, vjust=1))

### Move labels away from the plot and add colors
g + theme(axis.title.x = element_text(color="forestgreen", vjust = 0.35))

### Getting rid of axis ticks, tick text, and legend title
g + theme(axis.ticks.y = element_blank(), axis.text.y = element_blank(), legend.title=element_blank())

### Editing the legend title, add a grey box around the legend, and give legend keys an orange box
g + theme(legend.title = element_text(color="blue", size=10, face=bold), 
	legend.background=element_rect(fill="gray90", size=.8),
	legend.key = element_rect(fill="lightgoldenrod2"))

### Change legend position
g + theme(legend.position = "top")

### Change the panel background color, and grid lines color
g + theme(panel.background = element_rect(fill="grey75"), 
	panel.grid.major = element_line(color = "lightgoldenrod2", size=1.2),
	panel.grid.minor = element_line(color="lightgoldenrod3"))

### Change the plot background (plot is the encompassing canvas) and plot margin
g + theme(plot.background = element_rect(fill="lightgoldenrod2"),
	plot.margin = unit(c(.5,2,2,.5), "cm") #T,R,B,L
	panel.background = element_rect(fill="grey75"))


## ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ##
# Working with Themes and Colors
## ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ##

### Using an economist theme
library(ggthemes)
ggplot(nmmaps, aes(date, temp, color=factor(season))) + geom_point() + ggtitle("My title")
+ theme_economist() + scale_color_economist()

### With ggthemes, we can also use tableau colors
g + scale_color_tableau()

### Change the size of all plot text elements in a theme
theme_set(theme_gray(base_size=20))

### Manually select the colors (suitable for categorical variables). Scale_color_manual use 
### the name argument as legend title
g + scale_color_manual(name = "Season", 
	values = c("dodgerblue4", "darkolivegreen4", "darkorchid3", "goldenrod1")) 

### Apply a color palette (suitable for categorical variables)
g + scale_color_brewer(palette="Set1")

### Manually select the sequential colors for continuous variables
g + scale_color_gradient(low = "darkkhaki", high="darkgreen")

# Change size of the symbols in each legend key
g + guides(color = guide_legend(override.aes=list(size=5)))

# Working with labs
g + labs(x = "Date", y=expression(paste("Temperature (", degree ~ F, ")")), title= "Temperature")