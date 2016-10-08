#groceries dataset - market basket analysis
library(arules)
library(arulesViz)
library(datasets)
data(Groceries)


df_trans = uci [!duplicated( uci ), ] 
sum(duplicated( df_trans )) == 0 
df_trans <- as(split( df_trans $StockCode, df_trans $InvoiceNo), "transactions")


itemFrequencyPlot(df_trans,topN=20,type="absolute")
# Get the rules
rules <- apriori(df_trans, parameter = list(supp = 0.001, conf = 0.8))

# Show the top 5 rules, but only 2 digits
options(digits=2)
inspect(rules[1:5])

#sorting based on confidance
rules<-sort(rules, by="confidence", decreasing=TRUE)

#removing repeats 
subset.matrix <- is.subset(rules, rules)
subset.matrix[lower.tri(subset.matrix, diag=T)] <- NA
redundant <- colSums(subset.matrix, na.rm=T) >= 1
rules.pruned <- rules[!redundant]
rules<-rules.pruned

#look for customers to target products based on product in his basket eg:whole milk on rhs
rules<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.08), 
               appearance = list(default="lhs",rhs="whole milk"),
               control = list(verbose=F))
rules<-sort(rules, decreasing=TRUE,by="confidence")
inspect(rules[1:5])

#above logic with whole milk on lhs
rules<-apriori(data=, parameter=list(supp=0.001,conf = 0.15,minlen=2), 
               appearance = list(default="rhs",lhs="whole milk"),
               control = list(verbose=F))
rules<-sort(rules, decreasing=TRUE,by="confidence")
inspect(rules[1:5])

#visualizations
library(arulesViz)
plot(rules,method="graph",interactive=TRUE,shading=NA)

#transpose attempts

df_trans <- as(split(uci$StockCode, uci$InvoiceNo), "transactions")

df_trans = uci [!duplicated( uci ), ] 
sum(duplicated( df_trans )) == 0 



write.csv(frt,file="temp.csv", row.names=FALSE) # say "temp.csv" is your text file
tranx <- list()

 for(i in unique(uci_retail$InvoiceNo)){
       tranx[[i]] <- unlist(uci_retail$Description[uci_retail$InvoiceNo==i])
  }
