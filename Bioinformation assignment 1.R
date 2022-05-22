#1 Read in the "gene_expression.tsv" data file
URL = "https://raw.githubusercontent.com/markziemann/SLE712_files/master/assessment_task3/bioinfo_asst3_part1_files/gene_expression.tsv"
gene_exp <- read.table(URL, stringsAsFactors = FALSE, header = TRUE)

gene_exp
str(gene_exp)

#showing the values for the first 6 rows.
gene_exp[1:6,]

#2 new col containing the mean from all other cols.
gene_mean <- (gene_exp$GTEX.1117F.0226.SM.5GZZ7 + gene_exp$GTEX.1117F.0426.SM.5EGHI + gene_exp$GTEX.1117F.0526.SM.5EGHJ) /3
gene_exp$Exp.Mean <- signif(gene_mean, digits = 6)

#USE APPLY()


gene_exp[1:6,]

#3 list of 10 gene with the highest mean

high_mean <- gene_exp[order(-gene_exp$Exp.Mean),]
high_mean

high_mean[1:10,]

#4 How many gene have a mean <10 

true_sum <- gene_exp$Exp.Mean < 10

sum(true_sum, na.rm = TRUE)

#5 histagram of mean values 

x_vals <- gene_exp$Exp.Mean
#Jess's hist, just stack overflow to to make my own adjustments 
h <-hist(x_vals,main="Part1 Q5: Mean Gene Expression Values", xlab="Mean Gene Expression",breaks="scott",xlim=c(0,10000),ylim = c(0,50000))



#part 2 q6
URL2 <- "https://raw.githubusercontent.com/markziemann/SLE712_files/master/assessment_task3/bioinfo_asst3_part1_files/growth_data.csv"
grow_data <- read.csv(URL2)
str(grow_data)

#mean and sd of

#calcing mean and SD at start and end of study at each site 
#grow_data[grep("northeast",rownames(grow_data$Site)),]
NE_data <- 
str(NE_data)
NE_data
NE_mean <- 
NE_mean

#new method 
str(NE_data)
NE_data <-grow_data[grep("northeast", grow_data$Site),]
NE_mean05 <- mean(NE_data$Circumf_2005_cm, na.rm = TRUE)
NE_SD05 <- sd(NE_data$Circumf_2005_cm, na.rm = TRUE)
NE_mean20 <- mean(NE_data$Circumf_2020_cm, na.rm = TRUE)
NE_SD20 <- sd(NE_data$Circumf_2020_cm, na.rm = TRUE,)
#figure out how to lower the signifs
#southwest data
SW_data <-grow_data[grep("southwest", grow_data$Site),]
SW_mean05 <- mean(SW_data$Circumf_2005_cm, na.rm = TRUE)
SW_SD05 <- sd(SW_data$Circumf_2005_cm, na.rm = TRUE)
SW_mean20 <- mean(SW_data$Circumf_2020_cm, na.rm = TRUE)
SW_SD20 <- sd(SW_data$Circumf_2020_cm, na.rm = TRUE)

#BOX PLOT 

boxplot(NE_data$Circumf_2005_cm, NE_data$Circumf_2020_cm,
        SW_data$Circumf_2005_cm, SW_data$Circumf_2020_cm,
        main ="Comparing Plant Circumference Data at Different Sites Over Time",
        names = c("Northeast 2005","Northeast 2020","Southwest 2005","Southwest 2020"),
        ylab = "Mean Tree Circumference (cm)",
        col = "green"
        )
#TEST












#botplot, stack overflow to find out how to add extra details to the boxplot, eg adding spaces between the sets of box plots. 

