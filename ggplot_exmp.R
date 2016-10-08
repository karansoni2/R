groups<-c(rep("blue",3990),
          rep("red",4140),
          rep("orange",1890),
          rep("green",3770),
          rep("purple",855)
          )

ggmap(baylor, extent = "panel") +
  annotate("segment", x=-97.1175, xend=-97.1188, y=31.5449, yend=31.5485,
           colour=I("red"), arrow = arrow(length=unit(0.4,"cm")), size = 1.5) +
  annotate("rect", xmin=-97.122, ymin=31.5441, xmax=-97.113, ymax=31.5449,
           fill = I("white"), alpha = I(3/4)) +
  annotate("text", x=-97.1175, y=31.5445, label = "Department of Statistical Science",
           colour = I("red"), size = 4)


murder <- subset(crime, offense == "murder")
qmplot(lon, lat, data = murder, colour = I('red'), size = I(3), darken = .3)
