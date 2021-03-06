# Import library

library(arules)
library(arulesViz)

# Datasets groceries (transaksi penjualan toko) sudah tersedia di RStudio
data("Groceries")

# Jumlah data
dim(Groceries)

# Inpect data Groceries
inspect(Groceries)

# Ambil data ke 04-103 sesuai NPM 1610631170004 (Abdul Latif Munjiat)
Groceries.npm.004 <- Groceries [4:103]

# Inpect data Grosir
inspect(Groceries.npm.004)

summary(Groceries.npm.004)

#Menampilkan top 10 item yang paling banyak dibeli (1 Item)
itemFrequencyPlot(Groceries.npm.004,topN=10,type="absolute")
itemsets<-apriori(Groceries.npm.004,parameter = list(minlen=1,maxlen=1,support=0.01,target="frequent itemsets"))
inspect(head(sort(itemsets, by="support"),10))

#Menampilkan top 10 pasang item yang paling banyak dibeli secara bersamaan (2 Item)
itemsets<-apriori(Groceries.npm.004,parameter = list(minlen=2,maxlen=2,support=0.01,target="frequent itemsets"))
inspect(head(sort(itemsets, by="support"),10))

#Menampilkan top 10 pasang item yang paling banyak dibeli secara bersamaan (3 Item)
itemsets<-apriori(Groceries.npm.004,parameter = list(minlen=3,maxlen=3,support=0.02,target="frequent itemsets"))
inspect(head(sort(itemsets, by="support"),10))

#Menampilkan 10 item dengan kemungkinan item yang akan dibeli ketika membeli suatu item dengan support 1% dan confidence 60%
rules<-apriori(Groceries.npm.004,parameter = list(support=0.01, confidence=0.6, target="rules"))
inspect(head(sort(rules, by="lift"),10))

#Sorting berdasarkan confidence
sorting_rules<-sort(rules,by="confidence",decreasing = T)
inspect(head(sort(sorting_rules, by="lift"),10))

