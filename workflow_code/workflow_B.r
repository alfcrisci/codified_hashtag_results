################################################################################################
# to install library rTwChannel
# devtools::install_github("alfcrisci/rTwChannel")

library(XLConnect)
library(rTwChannel)

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys")

#########################################################################################
# Load periods

period_channels=read.csv("period_channels.csv")
writeWorksheetToFile("period_channels.xls", period_channels, sheet="period_channels")

#########################################################################################
# Original raw data

analitic_full_LIG=readRDS("data/analitic_full_LIG.rds")
analitic_full_TOS=readRDS("data/analitic_full_TOS.rds")
analitic_full_PIE=readRDS("data/analitic_full_PIE.rds") 

#########################################################################################
# Analisys full  tweets

an_full_allertameteoLIG=readRDS("data/an_full_allertameteoLIG.rds")
an_full_allertameteoTOS=readRDS("data/an_full_allertameteoTOS.rds")
an_full_allertameteoPIE=readRDS("data/an_full_allertameteoPIE.rds")

#########################################################################################
# Analisys only original tweets

an_native_allertameteoLIG=readRDS("data/an_native_allertameteoLIG.rds")
an_native_allertameteoTOS=readRDS("data/an_native_allertameteoTOS.rds")
an_native_allertameteoPIE=readRDS("data/an_native_allertameteoPIE.rds")

################################################################################à
# load list of annotation for each category of hash and authors

res_notes_LIG_hash=readRDS("data/res_notes_LIG_hash.rds")
res_notes_TOS_hash=readRDS("data/res_notes_TOS_hash.rds")
res_notes_PIE_hash=readRDS("data/res_notes_PIE_hash.rds")

res_notes_LIG_authors=readRDS("data/res_notes_LIG_authors.rds")
res_notes_TOS_authors=readRDS("data/res_notes_TOS_authors.rds")
res_notes_PIE_authors=readRDS("data/res_notes_PIE_authors.rds")

################################################################################à
# load full annotation for hash and authors

full_notes_LIG_hash=readRDS("data/full_notes_LIG_hash.rds")
full_notes_TOS_hash=readRDS("data/full_notes_TOS_hash.rds")
full_notes_PIE_hash=readRDS("data/full_notes_PIE_hash.rds")
full_notes_LIG_authors=readRDS("data/full_notes_LIG_authors.rds")
full_notes_TOS_authors=readRDS("data/full_notes_TOS_authors.rds")
full_notes_PIE_authors=readRDS("data/full_notes_PIE_authors.rds")

################################################################################à
# create stat_notes full
#########################################################################################
setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/full")

stat_notes_hash_LIG_full=create_state_obj(an_full_allertameteoLIG$hash_date,res_notes_LIG_hash,fileName="stat_notes_hash_LIG_full")
stat_notes_hash_TOS_full=create_state_obj(an_full_allertameteoTOS$hash_date,res_notes_TOS_hash,fileName="stat_notes_hash_TOS_full")
stat_notes_hash_PIE_full=create_state_obj(an_full_allertameteoPIE$hash_date,res_notes_PIE_hash,fileName="stat_notes_hash_PIE_full")

stat_notes_authors_LIG_full=create_state_obj(an_full_allertameteoLIG$authors_date,res_notes_LIG_authors,fileName="stat_notes_authors_LIG_full")
stat_notes_authors_TOS_full=create_state_obj(an_full_allertameteoTOS$authors_date,res_notes_TOS_authors,fileName="stat_notes_authors_TOS_full")
stat_notes_authors_PIE_full=create_state_obj(an_full_allertameteoPIE$authors_date,res_notes_PIE_authors,fileName="stat_notes_authors_PIE_full")

stat_notes_mentions_LIG_full=create_state_obj(an_full_allertameteoLIG$mentions_date,res_notes_LIG_authors,fileName="stat_notes_mentions_LIG_full")
stat_notes_mentions_TOS_full=create_state_obj(an_full_allertameteoTOS$mentions_date,res_notes_TOS_authors,fileName="stat_notes_mentions_TOS_full")
stat_notes_mentions_PIE_full=create_state_obj(an_full_allertameteoPIE$mentions_date,res_notes_PIE_authors,fileName="stat_notes_mentions_PIE_full")



setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys")

##########################################################################################

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native")

stat_notes_hash_LIG_native=create_state_obj(an_native_allertameteoLIG$hash_date,res_notes_LIG_hash,fileName="stat_notes_hash_LIG_native")
stat_notes_hash_TOS_native=create_state_obj(an_native_allertameteoTOS$hash_date,res_notes_TOS_hash,fileName="stat_notes_hash_TOS_native")
stat_notes_hash_PIE_native=create_state_obj(an_native_allertameteoPIE$hash_date,res_notes_PIE_hash,fileName="stat_notes_hash_PIE_native")

stat_notes_authors_LIG_native=create_state_obj(an_native_allertameteoLIG$authors_date,res_notes_LIG_authors,fileName="stat_notes_authors_LIG_native")
stat_notes_authors_TOS_native=create_state_obj(an_native_allertameteoTOS$authors_date,res_notes_TOS_authors,fileName="stat_notes_authors_TOS_native")
stat_notes_authors_PIE_native=create_state_obj(an_native_allertameteoPIE$authors_date,res_notes_PIE_authors,fileName="stat_notes_authors_PIE_native")

stat_notes_mentions_LIG_native=create_state_obj(an_native_allertameteoLIG$mentions_date,res_notes_LIG_authors,fileName="stat_notes_mentions_LIG_native")
stat_notes_mentions_TOS_native=create_state_obj(an_native_allertameteoTOS$mentions_date,res_notes_TOS_authors,fileName="stat_notes_mentions_TOS_native")
stat_notes_mentions_PIE_native=create_state_obj(an_native_allertameteoPIE$mentions_date,res_notes_PIE_authors,fileName="stat_notes_mentions_PIE_native")

####################################################################################################################
# 
setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/full")

stat_notes_hash_TOS=readRDS("stat_notes_hash_TOS_full.rds")
stat_notes_authors_TOS=readRDS("stat_notes_authors_TOS_full.rds")
stat_notes_mentions_TOS=readRDS("stat_notes_mentions_TOS_full.rds")
stat_notes_hash_PIE=readRDS("stat_notes_hash_PIE_full.rds")
stat_notes_authors_PIE=readRDS("stat_notes_authors_PIE_full.rds")
stat_notes_mentions_PIE=readRDS("stat_notes_mentions_PIE_full.rds")
stat_notes_hash_LIG=readRDS("stat_notes_hash_LIG_full.rds")
stat_notes_authors_LIG=readRDS("stat_notes_authors_LIG_full.rds")
stat_notes_mentions_LIG=readRDS("stat_notes_mentions_LIG_full.rds")

####################################################################################################################
# i full with retweet statistics

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/full/LIG_out")

channel_LIG_stat=channel_outputs(an_full_allertameteoLIG,param="channel_stat",suffix_file="LIG", na_string="",filecsv =TRUE)
channel_LIG_daily_stat=channel_outputs(an_full_allertameteoLIG,param="daily_stat",suffix_file="LIG",filecsv =TRUE)

channel_LIG_top_authors=channel_outputs(an_full_allertameteoLIG,param="top_authors",suffix_file="LIG",filecsv =TRUE)
channel_LIG_top_hash=channel_outputs(an_full_allertameteoLIG,param="top_hash",suffix_file="LIG",filecsv =TRUE)
channel_LIG_top_mentions=channel_outputs(an_full_allertameteoLIG,param="top_mentions",suffix_file="LIG",filecsv =TRUE)
channel_LIG_topfull_authors_retweeted=channel_outputs(an_full_allertameteoLIG,param="topfull_authors_retweeted",suffix_file="LIG",filecsv =TRUE)
channel_LIG_topfull_message_retweeted=channel_outputs(an_full_allertameteoLIG,param="topfull_message_retweeted",suffix_file="LIG",filecsv =TRUE)
channel_LIG_topfull_message_retweeted=channel_outputs(an_full_allertameteoLIG,param="top_replies",suffix_file="LIG",filecsv =TRUE)

notes_hash_LIG_stat=notes_outputs(channel_LIG_daily_stat,stat_notes_hash_LIG,prefix_file="notes_hash_LIG");
notes_authors_LIG_stat=notes_outputs(channel_LIG_daily_stat,stat_notes_authors_LIG,prefix_file="notes_authors_LIG");
notes_mentions_LIG_stat=notes_outputs(channel_LIG_daily_stat,stat_notes_mentions_LIG,prefix_file="notes_mentions_LIG");
################################à

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/full/TOS_out")

channel_TOS_stat=channel_outputs(an_full_allertameteoTOS,param="channel_stat",suffix_file="TOS",filecsv =TRUE)
channel_TOS_daily_stat=channel_outputs(an_full_allertameteoTOS,param="daily_stat",suffix_file="TOS",filecsv =TRUE)
channel_TOS_top_authors=channel_outputs(an_full_allertameteoTOS,param="top_authors",suffix_file="TOS",filecsv =TRUE)
channel_TOS_top_hash=channel_outputs(an_full_allertameteoTOS,param="top_hash",suffix_file="TOS",filecsv =TRUE)
channel_TOS_top_mentions=channel_outputs(an_full_allertameteoTOS,param="top_mentions",suffix_file="TOS",filecsv =TRUE)
channel_TOS_topfull_authors_retweeted=channel_outputs(an_full_allertameteoTOS,param="topfull_authors_retweeted",suffix_file="TOS",filecsv =TRUE)
channel_TOS_topfull_message_retweeted=channel_outputs(an_full_allertameteoTOS,param="topfull_message_retweeted",suffix_file="TOS",filecsv =TRUE)
channel_TOS_topfull_message_retweeted=channel_outputs(an_full_allertameteoTOS,param="top_replies",suffix_file="TOS",filecsv =TRUE)


notes_hash_TOS_stat=notes_outputs(channel_TOS_daily_stat,stat_notes_hash_TOS,prefix_file="notes_hash_TOS");
notes_authors_TOS_stat=notes_outputs(channel_TOS_daily_stat,stat_notes_authors_TOS,prefix_file="notes_authors_TOS");
notes_mentions_TOS_stat=notes_outputs(channel_TOS_daily_stat,stat_notes_mentions_TOS,prefix_file="notes_mentions_TOS");
################################

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/full/PIE_out")

channel_PIE_stat=channel_outputs(an_full_allertameteoPIE,param="channel_stat",suffix_file="PIE",filecsv =TRUE)
channel_PIE_daily_stat=channel_outputs(an_full_allertameteoPIE,param="daily_stat",suffix_file="PIE",filecsv =TRUE)
channel_PIE_top_authors=channel_outputs(an_full_allertameteoPIE,param="top_authors",suffix_file="PIE",filecsv =TRUE)
channel_PIE_top_hash=channel_outputs(an_full_allertameteoPIE,param="top_hash",suffix_file="PIE",filecsv =TRUE)
channel_PIE_top_mentions=channel_outputs(an_full_allertameteoPIE,param="top_mentions",suffix_file="PIE",filecsv =TRUE)
channel_PIE_topfull_authors_retweeted=channel_outputs(an_full_allertameteoPIE,param="topfull_authors_retweeted",suffix_file="PIE",filecsv =TRUE)
channel_PIE_topfull_message_retweeted=channel_outputs(an_full_allertameteoPIE,param="topfull_message_retweeted",suffix_file="PIE",filecsv =TRUE)
channel_PIE_topfull_message_retweeted=channel_outputs(an_full_allertameteoTOS,param="top_replies",suffix_file="PIE",filecsv =TRUE)


notes_hash_PIE_stat=notes_outputs(channel_PIE_daily_stat,stat_notes_hash_PIE,prefix_file="notes_hash_PIE",filecsv =TRUE)
notes_authors_PIE_stat=notes_outputs(channel_PIE_daily_stat,stat_notes_authors_PIE,prefix_file="notes_authors_PIE",filecsv =TRUE)
notes_mentions_PIE_stat=notes_outputs(channel_PIE_daily_stat,stat_notes_mentions_PIE,prefix_file="notes_mentions_PIE",filecsv =TRUE)
################################à

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/full")

prefix_file="radar_"
cols_arrange=c(1,2,4,6)

df_LIG_TOS_hash=merge(notes_hash_LIG_stat$stat_full,notes_hash_TOS_stat$stat_full,by="category",suffixes=c("LIG","TOS"),all.x=T)
df_LIG_PIE_hash=merge(notes_hash_LIG_stat$stat_full,notes_hash_PIE_stat$stat_full,by="category",suffixes=c("LIG","PIE"),all.x=T)

df_LIG_TOS_PIE_hash=df_LIG_TOS_hash
df_LIG_TOS_PIE_hash$NfreqPIE=df_LIG_PIE_hash$NfreqPIE
df_LIG_TOS_PIE_hash$N_uniquePIE=df_LIG_PIE_hash$N_uniquePIE
write.csv(df_LIG_TOS_PIE_hash,"df_LIG_TOS_PIE_hash_complete.csv",row.names = FALSE)
df_LIG_TOS_PIE_hash=df_LIG_TOS_PIE_hash[,cols_arrange]
df_LIG_TOS_PIE_hash[,2]=as.numeric(df_LIG_TOS_PIE_hash[,2])
df_LIG_TOS_PIE_hash[,3]=as.numeric(df_LIG_TOS_PIE_hash[,3])
df_LIG_TOS_PIE_hash[,4]=as.numeric(df_LIG_TOS_PIE_hash[,4])

#########################################################################################################################################à

df_LIG_TOS_authors=merge(notes_authors_LIG_stat$stat_full,notes_authors_TOS_stat$stat_full,by="category",suffixes=c("LIG","TOS"),all.x=T)
df_LIG_PIE_authors=merge(notes_authors_LIG_stat$stat_full,notes_authors_PIE_stat$stat_full,by="category",suffixes=c("LIG","PIE"),all.x=T)

df_LIG_TOS_PIE_authors=df_LIG_TOS_authors
df_LIG_TOS_PIE_authors$NfreqPIE=df_LIG_PIE_authors$NfreqPIE
df_LIG_TOS_PIE_authors$N_uniquePIE=df_LIG_PIE_authors$N_uniquePIE
write.csv(df_LIG_TOS_PIE_authors,"df_LIG_TOS_PIE_authors_complete.csv",row.names = FALSE)

df_LIG_TOS_PIE_authors=df_LIG_TOS_PIE_authors[,cols_arrange]
df_LIG_TOS_PIE_authors[,2]=as.numeric(df_LIG_TOS_PIE_authors[,2])
df_LIG_TOS_PIE_authors[,3]=as.numeric(df_LIG_TOS_PIE_authors[,3])
df_LIG_TOS_PIE_authors[,4]=as.numeric(df_LIG_TOS_PIE_authors[,4])

#########################################################################################################################################à

df_LIG_TOS_mentions=merge(notes_mentions_LIG_stat$stat_full,notes_mentions_TOS_stat$stat_full,by="category",suffixes=c("LIG","TOS"),all.x=T)
df_LIG_PIE_mentions=merge(notes_mentions_LIG_stat$stat_full,notes_mentions_PIE_stat$stat_full,by="category",suffixes=c("LIG","PIE"),all.x=T)

df_LIG_TOS_PIE_mentions=df_LIG_TOS_mentions
df_LIG_TOS_PIE_mentions$NfreqPIE=df_LIG_PIE_mentions$NfreqPIE
df_LIG_TOS_PIE_mentions$N_uniquePIE=df_LIG_PIE_mentions$N_uniquePIE
write.csv(df_LIG_TOS_PIE_mentions,"df_LIG_TOS_PIE_mentions_complete.csv",row.names = FALSE)

df_LIG_TOS_PIE_mentions=df_LIG_TOS_PIE_mentions[,cols_arrange]
df_LIG_TOS_PIE_mentions[,2]=as.numeric(df_LIG_TOS_PIE_mentions[,2])
df_LIG_TOS_PIE_mentions[,3]=as.numeric(df_LIG_TOS_PIE_mentions[,3])
df_LIG_TOS_PIE_mentions[,4]=as.numeric(df_LIG_TOS_PIE_mentions[,4])

writeWorksheetToFile("LIG_TOS_PIE_authors_full.xls", df_LIG_TOS_PIE_authors, sheet="LIG_TOS_PIE_authors")
writeWorksheetToFile("LIG_TOS_PIE_mentions_full.xls", df_LIG_TOS_PIE_mentions, sheet="LIG_TOS_PIE_mentions")
writeWorksheetToFile("LIG_TOS_PIE_hash_full.xls", df_LIG_TOS_PIE_hash, sheet="LIG_TOS_PIE_hash")

write.csv(df_LIG_TOS_PIE_authors,"LIG_TOS_PIE_authors_full.csv")
write.csv(df_LIG_TOS_PIE_mentions,"LIG_TOS_PIE_mentions_full.csv")
write.csv(df_LIG_TOS_PIE_hash,"LIG_TOS_PIE_hash_full.csv")



#################################################################################################################################################à

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native/")

stat_notes_hash_TOS=readRDS("stat_notes_hash_TOS_native.rds")
stat_notes_authors_TOS=readRDS("stat_notes_authors_TOS_native.rds")
stat_notes_mentions_TOS=readRDS("stat_notes_mentions_TOS_native.rds")
stat_notes_hash_PIE=readRDS("stat_notes_hash_PIE_native.rds")
stat_notes_authors_PIE=readRDS("stat_notes_authors_PIE_native.rds")
stat_notes_mentions_PIE=readRDS("stat_notes_mentions_PIE_native.rds")
stat_notes_hash_LIG=readRDS("stat_notes_hash_LIG_native.rds")
stat_notes_authors_LIG=readRDS("stat_notes_authors_LIG_native.rds")
stat_notes_mentions_LIG=readRDS("stat_notes_mentions_LIG_native.rds")



#####################################################################################################################################################################
setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native/LIG_out")

channel_LIG_stat=channel_outputs(an_native_allertameteoLIG,param="channel_stat",suffix_file="LIG", na_string="",filecsv =TRUE)
channel_LIG_daily_stat=channel_outputs(an_native_allertameteoLIG,param="daily_stat",suffix_file="LIG",filecsv =TRUE)

channel_LIG_top_authors=channel_outputs(an_native_allertameteoLIG,param="top_authors",suffix_file="LIG",filecsv =TRUE)
channel_LIG_top_hash=channel_outputs(an_native_allertameteoLIG,param="top_hash",suffix_file="LIG",filecsv =TRUE)
channel_LIG_top_mentions=channel_outputs(an_native_allertameteoLIG,param="top_mentions",suffix_file="LIG",filecsv =TRUE)

notes_hash_LIG_stat=notes_outputs(channel_LIG_daily_stat,stat_notes_hash_LIG,prefix_file="notes_hash_LIG");
notes_authors_LIG_stat=notes_outputs(channel_LIG_daily_stat,stat_notes_authors_LIG,prefix_file="notes_authors_LIG",filecsv =TRUE)
notes_mentions_LIG_stat=notes_outputs(channel_LIG_daily_stat,stat_notes_mentions_LIG,prefix_file="notes_mentions_LIG",filecsv =TRUE)

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native/TOS_out")

channel_TOS_stat=channel_outputs(an_native_allertameteoTOS,param="channel_stat",suffix_file="TOS",filecsv =TRUE)
channel_TOS_daily_stat=channel_outputs(an_native_allertameteoTOS,param="daily_stat",suffix_file="TOS",filecsv =TRUE)
channel_TOS_top_authors=channel_outputs(an_native_allertameteoTOS,param="top_authors",suffix_file="TOS",filecsv =TRUE)
channel_TOS_top_hash=channel_outputs(an_native_allertameteoTOS,param="top_hash",suffix_file="TOS",filecsv =TRUE)
channel_TOS_top_mentions=channel_outputs(an_native_allertameteoTOS,param="top_mentions",suffix_file="TOS",filecsv =TRUE)


notes_hash_TOS_stat=notes_outputs(channel_TOS_daily_stat,stat_notes_hash_TOS,prefix_file="notes_hash_TOS")
notes_authors_TOS_stat=notes_outputs(channel_TOS_daily_stat,stat_notes_authors_TOS,prefix_file="notes_authors_TOS")
notes_mentions_TOS_stat=notes_outputs(channel_TOS_daily_stat,stat_notes_mentions_TOS,prefix_file="notes_mentions_TOS")

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native/PIE_out")

channel_PIE_stat=channel_outputs(an_native_allertameteoPIE,param="channel_stat",suffix_file="PIE",filecsv =TRUE)
channel_PIE_daily_stat=channel_outputs(an_native_allertameteoPIE,param="daily_stat",suffix_file="PIE",filecsv =TRUE)
channel_PIE_top_authors=channel_outputs(an_native_allertameteoPIE,param="top_authors",suffix_file="PIE",filecsv =TRUE)
channel_PIE_top_hash=channel_outputs(an_native_allertameteoPIE,param="top_hash",suffix_file="PIE",filecsv =TRUE)
channel_PIE_top_mentions=channel_outputs(an_native_allertameteoPIE,param="top_mentions",suffix_file="PIE",filecsv =TRUE)


notes_hash_PIE_stat=notes_outputs(channel_PIE_daily_stat,stat_notes_hash_PIE,prefix_file="notes_hash_PIE");
notes_authors_PIE_stat=notes_outputs(channel_PIE_daily_stat,stat_notes_authors_PIE,prefix_file="notes_authors_PIE");
notes_mentions_PIE_stat=notes_outputs(channel_PIE_daily_stat,stat_notes_mentions_PIE,prefix_file="notes_mentions_PIE");

#####################################################################################################################à##################
setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native")

prefix_file="radar_"
cols_arrange=c(1,2,4,6)

df_LIG_TOS_hash=merge(notes_hash_LIG_stat$stat_full,notes_hash_TOS_stat$stat_full,by="category",suffixes=c("LIG","TOS"),all.x=T)
df_LIG_PIE_hash=merge(notes_hash_LIG_stat$stat_full,notes_hash_PIE_stat$stat_full,by="category",suffixes=c("LIG","PIE"),all.x=T)

df_LIG_TOS_PIE_hash=df_LIG_TOS_hash
df_LIG_TOS_PIE_hash$NfreqPIE=df_LIG_PIE_hash$NfreqPIE
df_LIG_TOS_PIE_hash$N_uniquePIE=df_LIG_PIE_hash$N_uniquePIE
write.csv(df_LIG_TOS_PIE_hash,"native_LIG_TOS_PIE_hash_complete.csv",row.names = FALSE)


df_LIG_TOS_PIE_hash=df_LIG_TOS_PIE_hash[,cols_arrange]
df_LIG_TOS_PIE_hash[,2]=as.numeric(df_LIG_TOS_PIE_hash[,2])
df_LIG_TOS_PIE_hash[,3]=as.numeric(df_LIG_TOS_PIE_hash[,3])
df_LIG_TOS_PIE_hash[,4]=as.numeric(df_LIG_TOS_PIE_hash[,4])
########################################

df_LIG_TOS_authors=merge(notes_authors_LIG_stat$stat_full,notes_authors_TOS_stat$stat_full,by="category",suffixes=c("LIG","TOS"),all.x=T)
df_LIG_PIE_authors=merge(notes_authors_LIG_stat$stat_full,notes_authors_PIE_stat$stat_full,by="category",suffixes=c("LIG","PIE"),all.x=T)

df_LIG_TOS_PIE_authors=df_LIG_TOS_authors
df_LIG_TOS_PIE_authors$NfreqPIE=df_LIG_PIE_authors$NfreqPIE
df_LIG_TOS_PIE_authors$N_uniquePIE=df_LIG_PIE_authors$N_uniquePIE
write.csv(df_LIG_TOS_PIE_authors,"df_LIG_TOS_PIE_authors_complete.csv",row.names = FALSE)
df_LIG_TOS_PIE_authors=df_LIG_TOS_PIE_authors[,cols_arrange]

df_LIG_TOS_PIE_authors[,2]=as.numeric(df_LIG_TOS_PIE_authors[,2])
df_LIG_TOS_PIE_authors[,3]=as.numeric(df_LIG_TOS_PIE_authors[,3])
df_LIG_TOS_PIE_authors[,4]=as.numeric(df_LIG_TOS_PIE_authors[,4])


df_LIG_TOS_mentions=merge(notes_mentions_LIG_stat$stat_full,notes_mentions_TOS_stat$stat_full,by="category",suffixes=c("LIG","TOS"),all.x=T)
df_LIG_PIE_mentions=merge(notes_mentions_LIG_stat$stat_full,notes_mentions_PIE_stat$stat_full,by="category",suffixes=c("LIG","PIE"),all.x=T)

df_LIG_TOS_PIE_mentions=df_LIG_TOS_mentions
df_LIG_TOS_PIE_mentions$NfreqPIE=df_LIG_PIE_mentions$NfreqPIE
df_LIG_TOS_PIE_mentions$N_uniquePIE=df_LIG_PIE_mentions$N_uniquePIE

write.csv(df_LIG_TOS_PIE_mentions,"native_LIG_TOS_PIE_mentions_complete.csv",row.names = FALSE)

df_LIG_TOS_PIE_mentions=df_LIG_TOS_PIE_mentions[,cols_arrange]

df_LIG_TOS_PIE_mentions[,2]=as.numeric(df_LIG_TOS_PIE_mentions[,2])
df_LIG_TOS_PIE_mentions[,3]=as.numeric(df_LIG_TOS_PIE_mentions[,3])
df_LIG_TOS_PIE_mentions[,4]=as.numeric(df_LIG_TOS_PIE_mentions[,4])



writeWorksheetToFile("LIG_TOS_PIE_authors_native.xls", df_LIG_TOS_PIE_authors, sheet="LIG_TOS_PIE_authors")
writeWorksheetToFile("LIG_TOS_PIE_mentions_native.xls", df_LIG_TOS_PIE_mentions, sheet="LIG_TOS_PIE_mentions")
writeWorksheetToFile("LIG_TOS_PIE_hash_native.xls", df_LIG_TOS_PIE_hash, sheet="LIG_TOS_PIE_hash")

write.csv(df_LIG_TOS_PIE_authors,"LIG_TOS_PIE_authors_native.csv")
write.csv(df_LIG_TOS_PIE_mentions,"LIG_TOS_PIE_mentions_native.csv")
write.csv(df_LIG_TOS_PIE_hash,"LIG_TOS_PIE_hash_native.csv")

#################################################################################################################################à

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys")
#################################################################################################################################à

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/full/PIE_out")

tabella_hash_PIE_cat_full=an_full_allertameteoPIE$table_hash
tabella_hash_PIE_cat_full$cat=hash_look(tolower(an_full_allertameteoPIE$table_hash$hashtag),full_notes_PIE_hash[!duplicated(full_notes_PIE_hash)])
writeWorksheetToFile("tabella_hash_PIE_cat_full.xls", tabella_hash_PIE_cat_full, sheet="tabella_hash_PIE_cat_full")
write.csv(tabella_hash_PIE_cat_full,"tabella_hash_PIE_cat_full.csv")
setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native/PIE_out")

tabella_hash_PIE_cat_native=an_native_allertameteoPIE$table_hash
tabella_hash_PIE_cat_native$cat=hash_look(tolower(an_native_allertameteoPIE$table_hash$hashtag),full_notes_PIE_hash[!duplicated(full_notes_PIE_hash)])
writeWorksheetToFile("tabella_hash_PIE_cat_native.xls", tabella_hash_PIE_cat_native, sheet="tabella_hash_PIE_cat_native")
write.csv(tabella_hash_PIE_cat_native,"tabella_hash_PIE_cat_native.csv")

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/full/LIG_out")

tabella_hash_LIG_cat_full=an_full_allertameteoLIG$table_hash
tabella_hash_LIG_cat_full$cat=hash_look(tolower(an_full_allertameteoLIG$table_hash$hashtag),full_notes_LIG_hash[!duplicated(full_notes_LIG_hash)])
writeWorksheetToFile("tabella_hash_LIG_cat_full.xls", tabella_hash_LIG_cat_full, sheet="tabella_hash_LIG_cat_full")
write.csv(tabella_hash_LIG_cat_full,"tabella_hash_LIG_cat_full.csv")

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native/LIG_out")

tabella_hash_LIG_cat_native=an_native_allertameteoLIG$table_hash
tabella_hash_LIG_cat_native$cat=hash_look(tolower(an_native_allertameteoLIG$table_hash$hashtag),full_notes_LIG_hash[!duplicated(full_notes_LIG_hash)])
writeWorksheetToFile("tabella_hash_LIG_cat_native.xls", tabella_hash_LIG_cat_native, sheet="tabella_hash_LIG_cat_native")
write.csv(tabella_hash_LIG_cat_native,"tabella_hash_LIG_cat_native.csv")

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/full/TOS_out")

tabella_hash_TOS_cat_full=an_full_allertameteoTOS$table_hash
tabella_hash_TOS_cat_full$cat=hash_look(tolower(an_full_allertameteoTOS$table_hash$hashtag),full_notes_TOS_hash[!duplicated(full_notes_TOS_hash)])
writeWorksheetToFile("tabella_hash_TOS_cat_full.xls", tabella_hash_TOS_cat_full, sheet="tabella_hash_TOS_cat_full")
write.csv(tabella_hash_TOS_cat_full,"tabella_hash_TOS_cat_full.csv")
setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native/TOS_out")

tabella_hash_TOS_cat_native=an_native_allertameteoTOS$table_hash
tabella_hash_TOS_cat_native$cat=hash_look(tolower(an_native_allertameteoTOS$table_hash$hashtag),full_notes_TOS_hash[!duplicated(full_notes_TOS_hash)])
writeWorksheetToFile("tabella_hash_TOS_cat_native.xls", tabella_hash_TOS_cat_native, sheet="tabella_hash_TOS_cat_native")
write.csv(tabella_hash_TOS_cat_native,"tabella_hash_TOS_cat_native.csv")

####################################################################################################################################################################à
setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/full/PIE_out")

tabella_authors_PIE_cat_full=an_full_allertameteoPIE$table_authors
tabella_authors_PIE_cat_full$cat=hash_look(tolower(an_full_allertameteoPIE$table_authors$authors),full_notes_PIE_authors[!duplicated(full_notes_PIE_authors)])
writeWorksheetToFile("tabella_authors_PIE_cat_full.xls", tabella_authors_PIE_cat_full, sheet="tabella_authors_PIE_cat_full")
write.csv( tabella_authors_PIE_cat_full,"tabella_authors_PIE_cat_full.csv")


setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native/PIE_out")

tabella_authors_PIE_cat_native=an_native_allertameteoPIE$table_authors
tabella_authors_PIE_cat_native$cat=hash_look(tolower(an_native_allertameteoPIE$table_authors$authors),full_notes_PIE_authors[!duplicated(full_notes_PIE_authors)])
writeWorksheetToFile("tabella_authors_PIE_cat_native.xls", tabella_authors_PIE_cat_native, sheet="tabella_authors_PIE_cat_native")
write.csv( tabella_authors_PIE_cat_native,"tabella_authors_PIE_cat_native.csv")

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/full/LIG_out")

tabella_authors_LIG_cat_full=an_full_allertameteoLIG$table_authors
tabella_authors_LIG_cat_full$cat=hash_look(tolower(an_full_allertameteoLIG$table_authors$authors),full_notes_LIG_authors[!duplicated(full_notes_LIG_authors)])
writeWorksheetToFile("tabella_authors_LIG_cat_full.xls", tabella_authors_LIG_cat_full, sheet="tabella_authors_LIG_cat_full")
write.csv( tabella_authors_TOS_cat_full,"tabella_authors_TOS_cat_full.csv")

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native/LIG_out")

tabella_authors_LIG_cat_native=an_native_allertameteoLIG$table_authors
tabella_authors_LIG_cat_native$cat=hash_look(tolower(an_native_allertameteoLIG$table_authors$authors),full_notes_LIG_authors[!duplicated(full_notes_LIG_authors)])
writeWorksheetToFile("tabella_authors_LIG_cat_native.xls", tabella_authors_LIG_cat_native, sheet="tabella_authors_LIG_cat_native")

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/full/TOS_out")

tabella_authors_TOS_cat_full=an_full_allertameteoTOS$table_authors
tabella_authors_TOS_cat_full$cat=hash_look(tolower(an_full_allertameteoTOS$table_authors$authors),full_notes_TOS_authors[!duplicated(full_notes_TOS_authors)])
writeWorksheetToFile("tabella_authors_TOS_cat_full.xls", tabella_authors_TOS_cat_full, sheet="tabella_authors_TOS_cat_full")
write.csv( tabella_authors_TOS_cat_full,"tabella_authors_TOS_cat_full.csv")

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native/TOS_out")

tabella_authors_TOS_cat_native=an_native_allertameteoTOS$table_authors
tabella_authors_TOS_cat_native$cat=hash_look(tolower(an_native_allertameteoTOS$table_authors$authors),full_notes_TOS_authors[!duplicated(full_notes_TOS_authors)])
writeWorksheetToFile("tabella_authors_TOS_cat_native.xls", tabella_authors_TOS_cat_native, sheet="tabella_authors_TOS_cat_native")
write.csv( tabella_authors_TOS_cat_native,"tabella_authors_TOS_cat_native.csv")

##############################################################################################################################################################################

####################################################################################################################################################################à
setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/full/PIE_out")

tabella_mentions_PIE_cat_full=an_full_allertameteoPIE$table_mentions
tabella_mentions_PIE_cat_full$cat=hash_look(tolower(an_full_allertameteoPIE$table_mentions$mentions),full_notes_PIE_authors[!duplicated(full_notes_PIE_authors)])
writeWorksheetToFile("tabella_mentions_PIE_cat_full.xls", tabella_mentions_PIE_cat_full, sheet="tabella_mentions_PIE_cat_full")
write.csv( tabella_mentions_PIE_cat_full,"tabella_mentions_PIE_cat_full.csv")

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native/PIE_out")

tabella_mentions_PIE_cat_native=an_native_allertameteoPIE$table_mentions
tabella_mentions_PIE_cat_native$cat=hash_look(tolower(an_native_allertameteoPIE$table_mentions$mentions),full_notes_PIE_authors[!duplicated(full_notes_PIE_authors)])
writeWorksheetToFile("tabella_mentions_PIE_cat_native.xls", tabella_mentions_PIE_cat_native, sheet="tabella_mentions_PIE_cat_native")
write.csv( tabella_mentions_PIE_cat_native,"tabella_mentions_PIE_cat_native.csv")

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/full/LIG_out")

tabella_mentions_LIG_cat_full=an_full_allertameteoLIG$table_mentions
tabella_mentions_LIG_cat_full$cat=hash_look(tolower(an_full_allertameteoLIG$table_mentions$mentions),full_notes_LIG_authors[!duplicated(full_notes_LIG_authors)])
writeWorksheetToFile("tabella_mentions_LIG_cat_full.xls", tabella_mentions_LIG_cat_full, sheet="tabella_mentions_LIG_cat_full")
write.csv( tabella_mentions_LIG_cat_full,"tabella_mentions_LIG_cat_full.csv")

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native/LIG_out")

tabella_mentions_LIG_cat_native=an_native_allertameteoLIG$table_mentions
tabella_mentions_LIG_cat_native$cat=hash_look(tolower(an_native_allertameteoLIG$table_mentions$mentions),full_notes_LIG_authors[!duplicated(full_notes_LIG_authors)])
writeWorksheetToFile("tabella_mentions_LIG_cat_native.xls", tabella_mentions_LIG_cat_native, sheet="tabella_mentions_LIG_cat_native")
write.csv( tabella_mentions_LIG_cat_native,"tabella_mentionsLIG_cat_native.csv")

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/full/TOS_out")

tabella_mentions_TOS_cat_full=an_full_allertameteoTOS$table_mentions
tabella_mentions_TOS_cat_full$cat=hash_look(tolower(an_full_allertameteoTOS$table_mentions$mentions),full_notes_TOS_authors[!duplicated(full_notes_TOS_authors)])
writeWorksheetToFile("tabella_mentions_TOS_cat_full.xls", tabella_mentions_TOS_cat_full, sheet="tabella_mentions_TOS_cat_full")
write.csv( tabella_mentions_TOS_cat_full,"tabella_mentions_TOS_cat_full.csv")

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native/TOS_out")

tabella_mentions_TOS_cat_native=an_native_allertameteoTOS$table_mentions
tabella_mentions_TOS_cat_native$cat=hash_look(tolower(an_native_allertameteoTOS$table_mentions$mentions),full_notes_TOS_authors[!duplicated(full_notes_TOS_authors)])
writeWorksheetToFile("tabella_mentions_TOS_cat_native.xls", tabella_mentions_TOS_cat_native, sheet="tabella_mentions_TOS_cat_native")
write.csv( tabella_mentions_TOS_cat_native,"tabella_mentions_TOS_cat_native.csv")

##############################################################################################################################################################################


