# BioInformatics Report 3 READ ME 
### by Greg Farmer (ID:221457201)

In this report, I aim to execute the criteria in the assignment in a clear and concise manner.


This report contians 2 parts:


 - First, importing and assessing gene expression and growth data.
 
 
 - Second, Import and compare biological sequence diversity between Mycobacterium tuberculosis and Escherichia coli
 
 
When kitting the report, the final chunk will take a few minutes to finish due to the large amount of information being processed in the final step.


Please be patient, thank you. 
 
 
Below I'm going to detail the thought process for every chunk in the RMarkdown file for clarity of the reader. 


**Set Up**


To simply load in the libraries needed to properly run the html report, being:


 - seqinr
 
 
 - kableExtra
 
 
 - R.utils
 
 
 - dplyr
 
 
**mychunk1.1**


The first set of data needed was in a table format, so the URL was set and the table of loaded into r. The first six rows of data were specified to be displayed, the `head` could've been used but I wanted to speficy just in case. 


**muchunk1.2**


The mean of all the columns needed was found, added together and divided my three.


The means were then added into the table as a new column titled Mean.


**mychunk1.3**


The table was ordered my mean from highest to lowest and the top ten were displayed.


**mychunk1.4**


The mean data was sorted for values higher than ten, which returned either TRUE or FALSE. 


Then using `sum`, the total amount number of TRUEs (those with a higher mean value than 10) were calculated. 


**mychunk1.5**


The histogram showing mean gene expression. Using the term breaks = "scott" formatted the bars of the graph the best, this was troubleshot using information from stackoverflow.com .


The colour was chosen to be blue because that's the best colour. 


The x and y lims were changed to hit majority of the data.


**mychunk1.6**


The next set of data was a .cvs file. The URL was specified and the `read.cvs` function was used to properly import the data. 


**mychunk1.7**


The `grep` function was used to isolate the NorthEast and the SouthWest data. The years were than isolated from that new data sets with the `$` sign. 


Simply using the `mean` and `sd` for each of the new data-sets returned the data needed. `cat(paste` was used to print out set value with what it represented to make the output more readable . 


A `function` could have been used in this instance, but having taken a while to get all the code working I didn't want to risk it failing. 


**mychunk1.8**


A boxplot showing all the different years of growth, separated by year and by location. The 2005 data is harder to read due to the small size of the plant. 


The boxplot was made green becuase plant are scientifically green. 


**mychunk1.9**


The mean of the last ten years was calculated, from 2010 to 2020 


The a new data set was made containing only the years from 2010 to 2020, the mean values were added together and divided by three.


**mychunk1.10**


The t-test was very straight forward, using the `t.test` function. 


To do the `wilcox.test`, first the data being used at to be unlisted. After that it was appropriate to use in the `wilcox.test` function. 


**mychunk2.1**

Both of the files needed for part 2 are in the FASTA format. This code allowed the files to be downloaded, unzipped and read into r


**mychunk2.2**


Simply, showing the total amount of coding sequences 


**mychunk2.3**


Using the `sapply` function allows us to calculate the total number of base pairs in the coding sequences. 


**mychunk2.4**


The boxplot compared the lengths of all the coding sequences of the two organisms. 


The colours are to visually separate the bow box plots and for some fun.


**mychunk2.5**


`signif` was used here to limit the significant figures on the mean valuse to make the output more readable. 


**mychunk2.6**


`unlist` converts the data from a list to a large table. From there using the `seqinr::count` function shows us how many of each nucleotide there is in the entire coding sequences data.


**mychunk2.7**


This part was tricky. 


The data is in a list format so `lapply` allows us to use the `translate` function on the whole list. 


The termination codon was also removed from the set, because it is not included in the proteins.


**mychunk2.8**

Barplot compared the nucleotide composition of the two organisms


**mychunk2.9**

Barplot comparing the amino acid composistion of the two organisms


**mychunk2.10**


Table showing the codon bias' of both organisms, sorted by the RSCU 


**mychunk2.11**


`options(scipen=999)` gets rid of scientific notation, making the smaller values a littler clearer.


The amino acid of M. tuberculosis sequences was read in word lengths of 3, and the occurrence of each "word" is recorded. From that we can sort the resulting table by frequncey to find the 5 most and least used 3-mers


Taking those 3-mers and using a `grep`function, I was able to find the same over or under used 3-mers in E. coli eg grep("AAA", rownames(e_freq3))


I did this for each on the 3-mers individually, and placed there location into a `c()` function. The results are shown in a barplot 


**mychunk2.12**


This barplot is the under-represented 3mers 


**mychunk2.13**


The process I described in mychuck2.11 was done for the over and under represented 4-mers in M. tuberculosis. And using `grep`, the same 4-mers were found in E. coli


**mychunk2.14**


Barplot of the over-represented 4-mers


**mychunk2.15**


Barplot of the under-represented 4-mers


**mychunk2.16**


Same processs as shown in mychunk2.11 and mychunk2.13, but used a wordsize of 5


**mychunk2.17**


Barplot of the over-represented 5-mers


**mychunk2.18**


Barplot of the under-represented 5-mers



Thank you very much for reviewing my work,


Greg Farmer

