#
# Libraries ####
#

# ggplot2 for plotting:
#install.packages("ggplot2")
library(ggplot2)

# fmsb to plot radar charts:
#install.packages("fmsb")
library(fmsb)



#
# Database ####
#

# Define the data frame:
#Evaluation <- data.frame(2.25, 1.75, 1.33)
#names(Evaluation) <- c("Overall Course", "Overall Teacher", "Professional Expertise")

# Add a row:
#Evaluation <- rbind(Evaluation, c(1.9, 1.7, 1.7))



#
# Results ####
#

# View results:
View(Evaluation)
summary(Evaluation)



#
# Plot a radar chart ####
#

# Max values (outher)
radarData <- as.data.frame(rbind(c(1.0, 1.0, 1.0)))

# Min values (inner)
radarData <- as.data.frame(rbind(radarData, c(6.0, 6.0, 6.0)))

# Transfer names:
names(radarData) <- names(Evaluation)

# Transfer data (means):
radarData <- rbind(radarData, c(mean(Evaluation$`Overall Course`), mean(Evaluation$`Overall Teacher`), mean(Evaluation$`Professional Expertise`)))

# Show radar chart:
radarchart(radarData,
           
           # No axis:
           axistype=0,
           
           # Border color:
           pcol=rgb(0.134,0.0,1.0,1.0),
           
           # Border width:
           plwd=4,
           
           # Area color:
           pfcol=rgb(0.134,0.0,1.0,0.4),
           
           # Grid:
           cglcol="black", cglty=1, axislabcol="black"
)



#
# Plot a boxplot ####
#

boxplotData <- as.data.frame(Evaluation$`Overall Course`)
boxplotData <- cbind(boxplotData, 'Overall Course')
names(boxplotData) <- c('Rating', 'Subject')
levels(boxplotData$Subject) <- c('Overall Course', 'Overall Teacher', 'Professional Expertise')

for(row in seq(1, nrow(Evaluation))) {
  boxplotData <- rbind(boxplotData, c(Evaluation[row,]$`Overall Teacher`, 'Overall Teacher'))
  boxplotData <- rbind(boxplotData, c(Evaluation[row,]$`Professional Expertise`, 'Professional Expertise'))
}

boxplotData$Rating <- as.numeric(as.character(boxplotData$Rating))

View(boxplotData)
summary(boxplotData)

ggplot(boxplotData,
       aes(
          x = Subject,
          y = Rating
       ))
  + geom_boxplot()
