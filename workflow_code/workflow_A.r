################################################################################################
# to install library rTwChannel

# devtools::install_github("alfcrisci/rTwChannel")


library(rTwChannel)

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/full")

analitic_full_LIG=readRDS("data/analitic_full_LIG.rds")
analitic_full_TOS=readRDS("data/analitic_full_TOS.rds")
analitic_full_PIE=readRDS("data/analitic_full_PIE.rds") 

#########################################################################################

period_channels=read.csv("data/period_channels.csv")

#########################################################################################
# analisys with retweets
analitic_full_LIG$isRetweet=unlist(lapply(analitic_full_LIG$text,FUN=function(x) is.retweet(x)))
analitic_full_TOS$isRetweet=unlist(lapply(analitic_full_TOS$text,FUN=function(x) is.retweet(x)))
analitic_full_PIE$isRetweet=unlist(lapply(analitic_full_PIE$text,FUN=function(x) is.retweet(x)))

analitic_full_LIG$screenName=analitic_full_LIG$screeName
analitic_full_TOS$screenName=analitic_full_TOS$screeName
analitic_full_PIE$screenName=analitic_full_PIE$screeName

an_full_allertameteoLIG=channel_analytic(analitic_full_LIG,use_channel_dates = FALSE,start_date=period_channels$start_date[1],end_date=period_channels$end_date[1],Ntop=11,naming="twitter")
an_full_allertameteoTOS=channel_analytic(analitic_full_TOS,use_channel_dates = FALSE,start_date=period_channels$start_date[2],end_date=period_channels$end_date[2],Ntop=11,naming="twitter")
an_full_allertameteoPIE=channel_analytic(analitic_full_PIE,use_channel_dates = FALSE,start_date=period_channels$start_date[3],end_date=period_channels$end_date[3],Ntop=11,naming="twitter")

saveRDS(an_full_allertameteoLIG,"data/an_full_allertameteoLIG.rds")
saveRDS(an_full_allertameteoTOS,"data/an_full_allertameteoTOS.rds")
saveRDS(an_full_allertameteoPIE,"data/an_full_allertameteoPIE.rds")

#########################################################################################
# analisys only original tweets



an_native_allertameteoLIG=channel_analytic(native_channel(analitic_full_LIG),use_channel_dates = FALSE,start_date=period_channels$start_date[1],end_date=period_channels$end_date[1],Ntop=11,only_original_tweet=TRUE,naming="twitter")
an_native_allertameteoTOS=channel_analytic(native_channel(analitic_full_TOS),use_channel_dates = FALSE,start_date=period_channels$start_date[2],end_date=period_channels$end_date[2],Ntop=11,only_original_tweet=TRUE,naming="twitter")
an_native_allertameteoPIE=channel_analytic(native_channel(analitic_full_PIE),use_channel_dates = FALSE,start_date=period_channels$start_date[3],end_date=period_channels$end_date[3],Ntop=11,only_original_tweet=TRUE,naming="twitter")

saveRDS(an_native_allertameteoLIG,"data/an_native_allertameteoLIG.rds")
saveRDS(an_native_allertameteoTOS,"data/an_native_allertameteoTOS.rds")
saveRDS(an_native_allertameteoPIE,"data/an_native_allertameteoPIE.rds")



