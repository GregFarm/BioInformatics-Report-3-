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

#Calcing the means from the last 10 years growth 



#calcing t.test and wilcox.test

#botplot, stack overflow to find out how to add extra details to the boxplot, eg adding spaces between the sets of box plots. 





#PART 2 Mycobacterium tuberculosis GCA_001318445
library("seqinr")
library("kableExtra")
library("R.utils")

# download cds Ecoli and Mturb
URL_M <- "http://ftp.ensemblgenomes.org/pub/bacteria/release-53/fasta/bacteria_4_collection/mycobacterium_tuberculosis_gca_001318445/cds/Mycobacterium_tuberculosis_gca_001318445.6505_5_10.cds.all.fa.gz"
download.file(URL3, destfile = "Mturb_cds.fa.gz")
URL_E="http://ftp.ensemblgenomes.org/pub/bacteria/release-53/fasta/bacteria_0_collection/escherichia_coli_str_k_12_substr_mg1655_gca_000005845/cds/Escherichia_coli_str_k_12_substr_mg1655_gca_000005845.ASM584v2.cds.all.fa.gz"
download.file(URL_E, destfile="ecoli_cds.fa.gz")

gunzip("Mturb_cds.fa.gz")
gunzip("ecoli_cds.fa.gz")

ecoli_cds <- seqinr::read.fasta("ecoli_cds.fa")
mturb_cds <- seqinr::read.fasta("Mturb_cds.fa")

length(mturb_cds)
# mturb coding seqs is 4752
length(ecoli_cds)
#ecoli coding seqs is 4239

m_len<-sapply(X = mturb_cds, FUN = length)
sum(m_len)

# mturb seq length 3,072,513
e_len<-sapply(X = ecoli_cds, FUN = length)
sum(e_len)
#ecoli seq length 3,978,528

#2 boxplot of all coding squences 

boxplot(m_len, e_len, names = c("M. tuberculosis","E. coli"),
        main = "Coding Sequence Length Comparisen between M. tuberculosis and E. coli",
          ylab = "Base Pair Length (bp)",
        col = c("green","red"))

#mean and median 
mean(m_len)
median(m_len)
#mean = 647, median = 501

mean(e_len)
median(e_len)
#mean = 939. median = 831

#3 nt count 
m_dna <- unlist(mturb_cds)
m_dna_comp <-count(m_dna, wordsize = 1)
m_dna_comp

e_dna <- unlist(ecoli_cds)
e_dna_comp <-count(e_dna, wordsize = 1)
e_dna_comp

#AA count 
m_prot <- lapply(X=mturb_cds, FUN = translate)
m_prot
m_comp<- unlist(m_prot)
m_aa <- count(m_comp, wordsize = 1, alphabet = aa)

e_prot <- lapply(X=ecoli_cds, FUN = translate)
e_prot
e_comp<- unlist(e_prot)
e_aa <-count(e_comp, wordsize = 1, alphabet = aa)

#MINUS THE TERMINATION CODON

#NT bar plots
barplot(m_dna_comp, xlab = "Nucleotide", ylab = "Frequency",
        main = "M. tuberculosis CDS comp")
#far highter GC content 
barplot(e_dna_comp, xlab = "Nucleotide", ylab = "Frequency",
        main = "E. coli CDS comp")

#two in one barpolt 
#barplot(as.matrix(rbind(El92, El96)), beside=TRUE)
barplot(as.matrix(rbind(m_dna_comp, e_dna_comp)), beside = TRUE, 
        names = c("a","c","g","t"), col = c("red","blue"),
        ylim = c(0,1200000),
        xlab = "Nucleotide", ylab = "Nucleotide Frequency (bp)",
        main = "Nucleotide Fequencies Comparison Between M. tuberculosis & E. coli")
#legend(19, c("Republicans", "Democrats"), horiz = T, col=c("red","blue"), fill=c("red","blue"))
legend("topleft", c("M.tuberculosis", "E. coli"), horiz = T, col = c("red", "blue"), fill = c("red", "blue"))


#AA bar plot
barplot(m_aa, xlab = "Amino Acids", 
        ylab = "Frequency", ylim = c(0,140000), 
        main = "Amino acids frequence in M. tuberculosis")

barplot(e_aa, xlab = "Amino Acids", ylab = "Frequency",
        main = "Amino acids frequence in E.coli")
# COMBINED
barplot(as.matrix(rbind(m_dna_comp, e_dna_comp)), beside = TRUE, 
        names = c("a","c","g","t"), col = c("red","blue"),
        ylim = c(0,1200000),
        xlab = "Nucleotide", ylab = "Nucleotide Frequency (bp)",
        main = "Nucleotide Fequencies Comparison Between M. tuberculosis & E. coli")

#4 Codon usages use the unpacked 
m_codon <- uco(m_dna, index="rscu", as.data.frame = TRUE)
m_codon

e_codon <-uco(e_dna, index="rscu", as.data.frame = TRUE)
e_codon

#sexy tables
?kable_paper

m_codon%>%
  kbl()%>%
  kable_paper("hover", full_width = F)


e_codon %>%
  kbl()%>%
  kable_paper("hover", full_width = F)



#K-mer profiling 

m_freq <- count(m_comp,wordsize=3,alphabet=aa,freq=TRUE)
head(m_freq)


m_codon_low <- m_codon[order(m_codon$freq),]
m_codon_low
















