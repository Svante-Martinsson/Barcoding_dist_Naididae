#amazing R. User Svante Martinsson, svantemartinsson.se
#2022-03-25
#Analysing and plotting uncorrected COI p-distances for Nais

library(ggplot2)
library(dplyr)
library(readr)

#clear R's brain
rm(list=ls())

#import dinstances data for Nais spp.
Nais_dist <- read_csv("https://raw.githubusercontent.com/Svante-Martinsson/Barcoding_dist_Naididae/main/Nais_dist.csv")

#data checks
names(Nais_dist)
glimpse(Nais_dist)

#arrange the dataset by distance, and then view it
Nais_dist<-arrange(Nais_dist, Dist)
View(Nais_dist)


#summarise the species specific datasets, including summary statistics like min and max.
summary(Nais_dist)


#Create a histogram of uncorrected genetic distance for Nais spp. COI
ggplot(Nais_dist, aes(x = Dist)) +
  geom_histogram(aes(colour=type, fill=type),
                 binwidth = 0.01, alpha=1) +
  coord_cartesian(xlim = c(0, 0.4))+
   scale_colour_manual(values = c("intraspecific" = "blue", "interspecific" ="yellow" , "unidentified" = "grey")) +
  scale_fill_manual(values = c("intraspecific" = "blue", "interspecific" ="yellow" , "unidentified" = "grey")) +
  xlab("uncorr p-dist") +
  ylab("count") +
  theme_bw()+
  theme(axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10),
        axis.text.x = element_text(size = 8), axis.text.y = element_text(size = 8),
        legend.title = element_blank(),
        legend.position = "bottom",
        panel.grid = element_blank())
        

#exporting the histogram
ggsave("Nais_histogram.png", width = 180, height = 80, units = "mm", dpi = 600)
