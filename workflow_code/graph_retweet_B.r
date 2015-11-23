options(java.parameters = "-Xmx4g" )

library(XLConnect)
library(rgexf)
library(rTwChannel)
library(qdapTools)
library(ggplot2)
library(dplyr)

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys")

period_channels=read.csv("full/data/period_channels.csv")


an_full_analitic_LIG=readRDS("full/data/an_full_allertameteoLIG.rds")
an_full_analitic_TOS=readRDS("full/data/an_full_allertameteoTOS.rds")
an_full_analitic_PIE=readRDS("full/data/an_full_allertameteoPIE.rds") 

an_native_analitic_LIG=readRDS("native/data/an_native_allertameteoLIG.rds")
an_native_analitic_TOS=readRDS("native/data/an_native_allertameteoTOS.rds")
an_native_analitic_PIE=readRDS("native/data/an_native_allertameteoPIE.rds") 

res_notes_LIG_authors=readRDS("full/data/res_notes_LIG_authors.rds")
res_notes_TOS_authors=readRDS("full/data/res_notes_TOS_authors.rds")
res_notes_PIE_authors=readRDS("full/data/res_notes_PIE_authors.rds")

res_notes_LIG_hash=readRDS("full/data/res_notes_LIG_hash.rds")
res_notes_TOS_hash=readRDS("full/data/res_notes_TOS_hash.rds")
res_notes_PIE_hash=readRDS("full/data/res_notes_PIE_hash.rds")

full_notes_LIG_authors=qdapTools::hash(as.data.frame(create_full_notes(res_notes_LIG_authors)))
full_notes_TOS_authors=qdapTools::hash(as.data.frame(create_full_notes(res_notes_TOS_authors)))
full_notes_PIE_authors=qdapTools::hash(as.data.frame(create_full_notes(res_notes_PIE_authors)))




names(an_full_analitic_LIG)


retweeted_PIE=an_full_analitic_PIE$table_authors_retweeted
retweeted_TOS=an_full_analitic_TOS$table_authors_retweeted
retweeted_LIG=an_full_analitic_LIG$table_authors_retweeted


retweeted_LIG$cat=hash_look(tolower(an_full_analitic_LIG$table_authors_retweeted$authors_retweeted),full_notes_LIG_authors)
retweeted_TOS$cat=hash_look(tolower(an_full_analitic_TOS$table_authors_retweeted$authors_retweeted),full_notes_TOS_authors)
retweeted_PIE$cat=hash_look(tolower(an_full_analitic_PIE$table_authors_retweeted$authors_retweeted),full_notes_PIE_authors)

retweeted_LIG$cat=replace(retweeted_LIG$cat, is.na(retweeted_LIG$cat),"OutChannel")
retweeted_TOS$cat=replace(retweeted_TOS$cat, is.na(retweeted_TOS$cat),"OutChannel")
retweeted_PIE$cat=replace(retweeted_PIE$cat, is.na(retweeted_PIE$cat),"OutChannel")

retweeted_PIE_agg=aggregate(retweeted_LIG$freq,list(retweeted_LIG$cat),sum)
retweeted_TOS_agg=aggregate(retweeted_TOS$freq,list(retweeted_TOS$cat),sum)
retweeted_LIG_agg=aggregate(retweeted_LIG$freq,list(retweeted_LIG$cat),sum)
retweeted_LIG_agg_perc=retweeted_LIG_agg%>% mutate_each_(funs(round((./sum(.)),3)*100),vars=c("x"))
retweeted_TOS_agg_perc=retweeted_TOS_agg%>% mutate_each_(funs(round((./sum(.)),3)*100),vars=c("x"))
retweeted_PIE_agg_perc=retweeted_PIE_agg%>% mutate_each_(funs(round((./sum(.)),3)*100),vars=c("x"))


ggplot(retweeted_PIE_agg_perc, aes(Group.1, x, fill=Group.1)) + geom_bar(stat="identity", position="dodge") + labs(x="Category Annotated", y="ReTweet(%)")+scale_fill_manual(values = rainbow(6)) + ylim(0,100) +coord_flip() + guides(fill = guide_legend(title = "Channel category"))
ggsave("Retweeted_PIE_agg_perc.png",width=15,dpi = 300)
ggplot(retweeted_TOS_agg_perc, aes(Group.1, x, fill=Group.1)) + geom_bar(stat="identity", position="dodge") + labs(x="Category Annotated", y="ReTweet(%)")+scale_fill_manual(values = rainbow(6)) + ylim(0,100)  +coord_flip() + guides(fill = guide_legend(title = "Channel category"))
ggsave("Retweeted_TOS_agg_perc.png",width=15,dpi = 300)
ggplot(retweeted_LIG_agg_perc, aes(Group.1, x, fill=Group.1)) + geom_bar(stat="identity", position="dodge") + labs(x="Category Annotated", y="ReTweet(%)")+scale_fill_manual(values = rainbow(6))  + ylim(0,100) +coord_flip() + guides(fill = guide_legend(title = "Channel category"))
ggsave("Retweeted_LIG_agg_perc.png",width=15,dpi = 300)






######################################################################################################################à
# retrieve annotation

# hashtag_notes=c(
#   "emergency",
#   "places",
#   "outside_places", 
#   "institution",
#   "media",
#   "weather", 
#   "mobility",
#   "others",
#   "social")
# res_notes_TOS_hash=retrieve_full_notes("allertameteoTOS", hashtag_notes,"",target="hash",  save = TRUE,filerds = "res_notes_TOS_hash.rds")
# saveRDS(res_notes_TOS_hash,"data/res_notes_TOS_hash.rds")
