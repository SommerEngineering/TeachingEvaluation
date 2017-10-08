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
Evaluation <- rbind(Evaluation, c(1.9, 1.7, 1.7))



#
# Results ####
#

# View results:
View(Evaluation)
summary(Evaluation)



#
# Plot a radar chart:
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
