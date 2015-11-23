library(ggplot2)
library(reshape2)
library(dplyr)
library(xts)
library(scales)

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys")

LIG_TOS_PIE_authors_full=read.csv("full/LIG_TOS_PIE_authors_full.csv")

LIG_TOS_PIE_authors_full=LIG_TOS_PIE_authors_full[,2:5]
write.csv(LIG_TOS_PIE_authors_full,"LIG_TOS_PIE_authors_full_graph_absolute.csv",row.names = FALSE)

LIG_TOS_PIE_authors_full=LIG_TOS_PIE_authors_full%>% mutate_each_(funs(round((./sum(.)),3)*100),vars=c("NfreqLIG","NfreqTOS","NfreqPIE"))
write.csv(LIG_TOS_PIE_authors_full,"LIG_TOS_PIE_authors_full_graph.csv",row.names=FALSE)

mdat <- melt(LIG_TOS_PIE_authors_full, id.vars="category",value.name = "Tweets")
mdat$category=gsub("others","Users",mdat$category)
ggplot(mdat, aes(gsub("Nfreq","#allertameteo",variable), Tweets, fill=category)) + geom_bar(stat="identity", position="dodge") + labs(x="Channel", y="Tweet(%)")+scale_fill_manual(values = rainbow(5)) +coord_flip()
ggsave("LIG_TOS_PIE_authors_full.png")


LIG_TOS_PIE_authors_native=read.csv("native/LIG_TOS_PIE_authors_native.csv")

LIG_TOS_PIE_authors_native=LIG_TOS_PIE_authors_native[,2:5]
write.csv(LIG_TOS_PIE_authors_native,"LIG_TOS_PIE_authors_native_graph_absolute.csv",row.names = FALSE)

LIG_TOS_PIE_authors_native=LIG_TOS_PIE_authors_native%>% mutate_each_(funs(round((./sum(.)),3)*100),vars=c("NfreqLIG","NfreqTOS","NfreqPIE"))
write.csv(LIG_TOS_PIE_authors_native,"LIG_TOS_PIE_authors_native_graph.csv",row.names = FALSE)
mdat <- melt(LIG_TOS_PIE_authors_native, id.vars="category",value.name = "Tweets")
mdat$category=gsub("others","Users",mdat$category)
ggplot(mdat, aes(gsub("Nfreq","#allertameteo",variable), Tweets, fill=category)) + geom_bar(stat="identity", position="dodge") + labs(x="Channel", y="Tweet(%)")+scale_fill_manual(values = rainbow(5)) +coord_flip()
ggsave("LIG_TOS_PIE_authors_native.png")



############################################################################################################################################################
# read table

tabella_hash_LIG_cat_full=read.csv("grafici/tabella_hash_LIG_cat_full.csv")  
tabella_hash_TOS_cat_full=read.csv("grafici/tabella_hash_TOS_cat_full.csv")
tabella_hash_PIE_cat_full=read.csv("grafici/tabella_hash_PIE_cat_full.csv")

##########################
LIG_TOS_PIE_hash_full=read.csv("full/LIG_TOS_PIE_hash_full.csv")

LIG_TOS_PIE_hash_full=LIG_TOS_PIE_hash_full[,2:5]

LIG_TOS_PIE_hash_full$NfreqLIG[1]=LIG_TOS_PIE_hash_full$NfreqLIG[1]-tabella_hash_LIG_cat_full$freq[which(tabella_hash_LIG_cat_full$hashtag=="#allertameteoLIG")]
LIG_TOS_PIE_hash_full$NfreqPIE[1]=LIG_TOS_PIE_hash_full$NfreqPIE[1]-tabella_hash_PIE_cat_full$freq[which(tabella_hash_PIE_cat_full$hashtag=="#allertameteoPM")]-tabella_hash_PIE_cat_full$freq[which(tabella_hash_PIE_cat_full$hashtag=="#allertameteoPIE")]
LIG_TOS_PIE_hash_full$NfreqTOS[1]=LIG_TOS_PIE_hash_full$NfreqTOS[1]-tabella_hash_TOS_cat_full$freq[which(tabella_hash_TOS_cat_full$hashtag=="#allertameteoTOS")]

LIG_TOS_PIE_hash_full[is.na(LIG_TOS_PIE_hash_full)] <- 0
write.csv(LIG_TOS_PIE_hash_full,"LIG_TOS_PIE_hash_full_graph_absolute.csv",row.names = FALSE)

LIG_TOS_PIE_hash_full=LIG_TOS_PIE_hash_full %>% mutate_each_(funs(round((./sum(.)),3)*100),vars=c("NfreqLIG","NfreqTOS","NfreqPIE"))
write.csv(LIG_TOS_PIE_hash_full,"LIG_TOS_PIE_hash_full_graph.csv",row.names = FALSE)

mdat <- melt(LIG_TOS_PIE_hash_full, id.vars="category",value.name = "Tweets")
mdat$category=gsub("others","Users",mdat$category)
ggplot(mdat, aes(gsub("Nfreq","#allertameteo",variable), Tweets, fill=category)) + geom_bar(stat="identity", position="dodge") + labs(x="Channel", y="Tweet(%)")+scale_fill_manual(values = rainbow(10)) +coord_flip()
ggsave("grafici/LIG_TOS_PIE_hash_full.png",width=15,dpi = 300)

##########################################################################################################################################################à

tabella_hash_LIG_cat_native=read.csv("grafici/tabella_hash_LIG_cat_native.csv")  
tabella_hash_TOS_cat_native=read.csv("grafici/tabella_hash_TOS_cat_native.csv")
tabella_hash_PIE_cat_native=read.csv("grafici/tabella_hash_PIE_cat_native.csv")

LIG_TOS_PIE_hash_native=read.csv("native/LIG_TOS_PIE_hash_native.csv")
LIG_TOS_PIE_hash_native=LIG_TOS_PIE_hash_native[,2:5]

# leave frequency #allertameteo* from emergency category wich was annotated

LIG_TOS_PIE_hash_native$NfreqLIG[1]=LIG_TOS_PIE_hash_native$NfreqLIG[1]-tabella_hash_LIG_cat_native$freq[which(tabella_hash_LIG_cat_native$hashtag=="#allertameteoLIG")]
LIG_TOS_PIE_hash_native$NfreqPIE[1]=LIG_TOS_PIE_hash_native$NfreqPIE[1]-tabella_hash_PIE_cat_native$freq[which(tabella_hash_PIE_cat_native$hashtag=="#allertameteoPM")]-tabella_hash_PIE_cat_native$freq[which(tabella_hash_PIE_cat_native$hashtag=="#allertameteoPIE")]
LIG_TOS_PIE_hash_native$NfreqTOS[1]=LIG_TOS_PIE_hash_native$NfreqTOS[1]-tabella_hash_TOS_cat_native$freq[which(tabella_hash_TOS_cat_native$hashtag=="#allertameteoTOS")]

LIG_TOS_PIE_hash_native[is.na(LIG_TOS_PIE_hash_native)] <- 0
write.csv(LIG_TOS_PIE_hash_native,"LIG_TOS_PIE_hash_native_graph_absolute.csv",row.names = FALSE)

LIG_TOS_PIE_hash_native=LIG_TOS_PIE_hash_native%>% mutate_each_(funs(round((./sum(.)),3)*100),vars=c("NfreqLIG","NfreqTOS","NfreqPIE"))

write.csv(LIG_TOS_PIE_hash_native,"LIG_TOS_PIE_hash_native_graph.csv",row.names = FALSE)
mdat <- melt(LIG_TOS_PIE_hash_native, id.vars="category",value.name = "Tweets")
mdat$category=gsub("others","Users",mdat$category)
ggplot(mdat, aes(gsub("Nfreq","#allertameteo",variable), Tweets, fill=category)) + geom_bar(stat="identity", position="dodge") + labs(x="Channel", y="Tweet(%)")+scale_fill_manual(values = rainbow(10)) +coord_flip()
ggsave("grafici/LIG_TOS_PIE_hash_native.png",width=15,dpi = 300)


##################################################################################################################à



LIG_TOS_PIE_mentions_full=read.csv("full/LIG_TOS_PIE_mentions_full.csv")
LIG_TOS_PIE_mentions_full=LIG_TOS_PIE_mentions_full[,2:5]
write.csv(LIG_TOS_PIE_mentions_full,"LIG_TOS_PIE_mentions_full_graph_absolute.csv",row.names = FALSE)

LIG_TOS_PIE_mentions_full=LIG_TOS_PIE_mentions_full%>% mutate_each_(funs(round((./sum(.)),3)*100),vars=c("NfreqLIG","NfreqTOS","NfreqPIE"))
write.csv(LIG_TOS_PIE_mentions_full,"LIG_TOS_PIE_mentions_full_graph.csv",row.names = FALSE)

mdat <- melt(LIG_TOS_PIE_mentions_full, id.vars="category",value.name = "Tweets")
mdat$category=gsub("others","Users",mdat$category)
ggplot(mdat, aes(gsub("Nfreq","#allertameteo",variable), Tweets, fill=category)) + geom_bar(stat="identity", position="dodge") + labs(x="Channel", y="Tweet(%)")+scale_fill_manual(values = rainbow(5)) +coord_flip()
ggsave("LIG_TOS_PIE_mentions_full.png")


LIG_TOS_PIE_mentions_native=read.csv("native/LIG_TOS_PIE_mentions_native.csv")
LIG_TOS_PIE_mentions_native=LIG_TOS_PIE_mentions_native[,2:5]
write.csv(LIG_TOS_PIE_mentions_native,"LIG_TOS_PIE_mentions_native_graph_absolute.csv",row.names = FALSE)

LIG_TOS_PIE_mentions_native=LIG_TOS_PIE_mentions_native%>% mutate_each_(funs(round((./sum(.)),3)*100),vars=c("NfreqLIG","NfreqTOS","NfreqPIE"))
write.csv(LIG_TOS_PIE_mentions_native,"LIG_TOS_PIE_mentions_native_graph.csv",row.names = FALSE)
mdat <- melt(LIG_TOS_PIE_mentions_native, id.vars="category",value.name = "Tweets")
mdat$category=gsub("others","Users",mdat$category)
ggplot(mdat, aes(gsub("Nfreq","#allertameteo",variable), Tweets, fill=category)) + geom_bar(stat="identity", position="dodge") + labs(x="Channel", y="Tweet(%)")+scale_fill_manual(values = rainbow(5)) +coord_flip()
ggsave("LIG_TOS_PIE_mentions_native.png")

#####################################################################################################################
#####################################################################################################################




daily_stat_TOS=read.csv("full/TOS_out/daily_stat_TOS.csv")
daily_stat_TOS[is.na(daily_stat_TOS)] <- 0
mdat <- melt(daily_stat_TOS[,1:3], id.vars="date")
ggplot(mdat, aes(as.Date(date), value, fill=variable)) + geom_bar(stat="identity") + labs(x="Date", y="Number of channel item")+scale_fill_manual(values = c('blue','red'))+scale_x_date(breaks = "1 day",labels=date_format("%d"))+ guides(fill = guide_legend(title = "Channel tweet"))
ggsave("Daily_tweets_TOS.pdf",width=15,dpi = 300)

daily_stat_LIG=read.csv("full/LIG_out/daily_stat_LIG.csv")
daily_stat_LIG[is.na(daily_stat_LIG)] <- 0
mdat <- melt(daily_stat_LIG[,1:3], id.vars="date")
ggplot(mdat, aes(as.Date(date), value, fill=variable)) + geom_bar(stat="identity") + labs(x="Date", y="Number of channel item")+scale_fill_manual(values = c('blue','red'))+scale_x_date(breaks = "1 day",labels=date_format("%d"))+ guides(fill = guide_legend(title = "Channel tweet"))
ggsave("Daily_tweets_LIG.pdf",width=15,dpi = 300)

daily_stat_PIE=read.csv("full/PIE_out/daily_stat_PIE.csv")
daily_stat_PIE[is.na(daily_stat_PIE)] <- 0
mdat <- melt(daily_stat_PIE[,1:3], id.vars="date")
ggplot(mdat, aes(as.Date(date), value, fill=variable)) + geom_bar(stat="identity") + labs(x="Date", y="Number of channel item")+scale_fill_manual(values = c('blue','red'))+scale_x_date(breaks = "1 day",labels=date_format("%d"))+ guides(fill = guide_legend(title = "Channel tweet"))
ggsave("Daily_tweets_PIE.pdf",width=15,dpi = 300)



#####################################################################################################################
#####################################################################################################################



top_authors_TOS=read.csv("full/TOS_out/top_authors_TOS.csv")
topfull_authors_retweeted_TOS=read.csv("full/TOS_out/topfull_authors_retweeted_TOS.csv
topfull_message_retweeted_TOS=read.csv("full/TOS_out/topfull_message_retweeted_TOS.csv

#################################################################################################################à
# references

# http://stackoverflow.com/questions/15231109/stacked-histogram-from-already-summarized-counts-using-ggplot2
# http://www.wekaleamstudios.co.uk/supplementary-material/
# http://rpubs.com/sinhrks/plot_ts
# http://rpubs.com/sinhrks/plot_tsstats

