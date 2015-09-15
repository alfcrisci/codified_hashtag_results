################################################################################################
# to install library rTwChannel
#devtools::install_github("alfcrisci/rTwChannel")


library(rTwChannel)

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys")

analitic_full_LIG=readRDS("analitic_full_LIG.rds")
analitic_full_TOS=readRDS("analitic_full_TOS.rds")
analitic_full_PIE=readRDS("analitic_full_PIE.rds") 

#########################################################################################

period_channels=read.csv("period_channels.csv")

#########################################################################################
# analisys with retweets

an_full_allertameteoLIG=channel_analytic(analitic_full_LIG,start_date=period_channels$start_date[1],end_date=period_channels$end_date[1],Ntop=11)
an_full_allertameteoTOS=channel_analytic(analitic_full_TOS,start_date=period_channels$start_date[2],end_date=period_channels$end_date[2],Ntop=11)
an_full_allertameteoPIE=channel_analytic(analitic_full_PIE,start_date=period_channels$start_date[3],end_date=period_channels$end_date[3],Ntop=11)

saveRDS(an_full_allertameteoLIG,"an_full_allertameteoLIG.rds")
saveRDS(an_full_allertameteoTOS,"an_full_allertameteoTOS.rds")
saveRDS(an_full_allertameteoPIE,"an_full_allertameteoPIE.rds")

#########################################################################################
# analisys only original tweets

an_native_allertameteoLIG=channel_analytic(analitic_full_LIG,start_date=period_channels$start_date[1],end_date=period_channels$end_date[1],Ntop=11,only_original_tweet=TRUE)
an_native_allertameteoTOS=channel_analytic(analitic_full_TOS,start_date=period_channels$start_date[2],end_date=period_channels$end_date[2],Ntop=11,only_original_tweet=TRUE)
an_native_allertameteoPIE=channel_analytic(analitic_full_PIE,start_date=period_channels$start_date[3],end_date=period_channels$end_date[3],Ntop=11,only_original_tweet=TRUE)

saveRDS(an_native_allertameteoLIG,"an_native_allertameteoLIG.rds")
saveRDS(an_native_allertameteoTOS,"an_native_allertameteoTOS.rds")
saveRDS(an_native_allertameteoPIE,"an_native_allertameteoPIE.rds")
