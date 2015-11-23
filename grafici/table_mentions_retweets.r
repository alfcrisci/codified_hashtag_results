library(ggplot2)
library(reshape2)
library(dplyr)
library(xts)
library(scales)

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys")
table_post_mentions_retweet=read.csv("table_post_mentions_retweet_full.csv")
retweets=table_post_mentions_retweet[table_post_mentions_retweet$Type=="retweet",]
retweets$Type=NULL

mdat <- melt(retweets, id.vars=c("Channel","Whopost"),value.name = "Posts")
mdat$category=gsub("others","Users",mdat$category)
mdat$Whopost=gsub("others","Users",mdat$Whopost)
mdat$variable=gsub("others","Users",mdat$variable)
ggplot(mdat, aes(Channel, Posts, fill=variable)) + geom_bar(stat="identity", position="dodge") +facet_wrap(~Whopost, scales="free")+ labs(x="Channel", y="ReTweets")+scale_fill_manual(values = rainbow(5))+ guides(fill = guide_legend(title = "Channel category"))+ theme(legend.position="left")
ggsave("retweets_table.png")

mentions=table_post_mentions_retweet[table_post_mentions_retweet$Type=="mentions",]
mentions$Type=NULL

mdat <- melt(mentions, id.vars=c("Channel","Whopost"),value.name = "Posts")
mdat$category=gsub("others","Users",mdat$category)
mdat$Whopost=gsub("others","Users",mdat$Whopost)
mdat$variable=gsub("others","Users",mdat$variable)
ggplot(mdat, aes(Channel, Posts, fill=variable)) + geom_bar(stat="identity", position="dodge") +facet_wrap(~Whopost, scales="free")+ labs(x="Channel", y="Mentions")+scale_fill_manual(values = rainbow(5))+ guides(fill = guide_legend(title = "Channel category"))+ theme(legend.position="left")
ggsave("mentions_table.png")

##########################################################################################à
# http://www.cookbook-r.com/Graphs/Legends_%28ggplot2%29/
