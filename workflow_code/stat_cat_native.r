options(java.parameters = "-Xmx4g" )

library(XLConnect)
library(rgexf)
library(rTwChannel)
library(qdapTools)

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys")

period_channels=read.csv("period_channels.csv")


#########################################################################################
# Load channel array of tweets raw data

analitic_native_LIG=native_channel(readRDS("analitic_full_LIG.rds"))
analitic_native_TOS=native_channel(readRDS("analitic_full_TOS.rds"))
analitic_native_PIE=native_channel(readRDS("analitic_full_PIE.rds")) 

saveRDS(analitic_native_LIG,"analitic_native_LIG.rds")
saveRDS(analitic_native_TOS,"analitic_native_TOS.rds")
saveRDS(analitic_native_PIE,"analitic_native_PIE.rds")


#################################################################################
res_notes_LIG_authors=readRDS("res_notes_LIG_authors.rds")
res_notes_TOS_authors=readRDS("res_notes_TOS_authors.rds")
res_notes_PIE_authors=readRDS("res_notes_PIE_authors.rds")

full_notes_LIG_authors=qdapTools::hash(as.data.frame(create_full_notes(res_notes_LIG_authors)))
full_notes_TOS_authors=qdapTools::hash(as.data.frame(create_full_notes(res_notes_TOS_authors)))
full_notes_PIE_authors=qdapTools::hash(as.data.frame(create_full_notes(res_notes_PIE_authors)))


saveRDS(full_notes_LIG_authors,"full_notes_LIG_authors.rds")
saveRDS(full_notes_TOS_authors,"full_notes_TOS_authors.rds")
saveRDS(full_notes_PIE_authors,"full_notes_PIE_authors.rds")



#####################################################################################

vec_cat_LIG=hash_look(tolower(analitic_native_LIG$screeName),full_notes_LIG_authors)
vec_cat_TOS=hash_look(tolower(analitic_native_TOS$screeName),full_notes_TOS_authors)
vec_cat_PIE=hash_look(tolower(analitic_native_PIE$screeName),full_notes_PIE_authors)



#####################################################################################

# "Institution"   "Weather"       "Media"         "Volunteer_NGO"

analitic_native_LIG_institution=analitic_native_LIG[which(vec_cat_LIG=="Institution"),]
analitic_native_LIG_weather=analitic_native_LIG[which(vec_cat_LIG=="Weather"),]
analitic_native_LIG_media=analitic_native_LIG[which(vec_cat_LIG=="Media"),]
analitic_native_LIG_volunteer_NGO=analitic_native_LIG[which(vec_cat_LIG=="Volunteer_NGO"),]

an_native_allertameteoLIG_institution=channel_analytic(analitic_native_LIG_institution,start_date=period_channels$start_date[1],end_date=period_channels$end_date[1],Ntop=10,only_original_tweet=TRUE)
an_native_allertameteoLIG_weather=channel_analytic(analitic_native_LIG_weather,start_date=period_channels$start_date[1],end_date=period_channels$end_date[1],Ntop=10,only_original_tweet=TRUE)
an_native_allertameteoLIG_media=channel_analytic(analitic_native_LIG_media,start_date=period_channels$start_date[1],end_date=period_channels$end_date[1],Ntop=10,only_original_tweet=TRUE)
an_native_allertameteoLIG_volunteer_NGO=channel_analytic(analitic_native_LIG_volunteer_NGO,start_date=period_channels$start_date[1],end_date=period_channels$end_date[1],Ntop=10,only_original_tweet=TRUE)

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native")

saveRDS(an_native_allertameteoLIG_institution,"an_native_allertameteoLIG_institution.rds")
saveRDS(an_native_allertameteoLIG_weather,"an_native_allertameteoLIG_weather.rds")
saveRDS(an_native_allertameteoLIG_media,"an_native_allertameteoLIG_media.rds")
saveRDS(an_native_allertameteoLIG_volunteer_NGO,"an_native_allertameteoLIG_volunteer_NGO.rds")


setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native/LIG_out")


channel_LIG_stat_institution=channel_outputs(an_native_allertameteoLIG_institution,param="channel_stat",suffix_file="LIG_institution")
channel_LIG_daily_stat_institution=channel_outputs(an_native_allertameteoLIG_institution,param="daily_stat",suffix_file="LIG_institution")
channel_LIG_top_authors_institution=channel_outputs(an_native_allertameteoLIG_institution,param="top_authors",suffix_file="LIG_institution")

channel_LIG_stat_weather=channel_outputs(an_native_allertameteoLIG_weather,param="channel_stat",suffix_file="LIG_weather")
channel_LIG_daily_stat_weather=channel_outputs(an_native_allertameteoLIG_weather,param="daily_stat",suffix_file="LIG_weather")
channel_LIG_top_authors_weather=channel_outputs(an_native_allertameteoLIG_weather,param="top_authors",suffix_file="LIG_weather")

channel_LIG_stat_media=channel_outputs(an_native_allertameteoLIG_media,param="channel_stat",suffix_file="LIG_media")
channel_LIG_daily_stat_media=channel_outputs(an_native_allertameteoLIG_media,param="daily_stat",suffix_file="LIG_media")
channel_LIG_top_authors_media=channel_outputs(an_native_allertameteoLIG_media,param="top_authors",suffix_file="LIG_media")

channel_LIG_stat_volunteer_NGO=channel_outputs(an_native_allertameteoLIG_volunteer_NGO,param="channel_stat",suffix_file="LIG_volunteer_NGO")
channel_LIG_daily_stat_volunteer_NGO=channel_outputs(an_native_allertameteoLIG_volunteer_NGO,param="daily_stat",suffix_file="LIG_volunteer_NGO")
channel_LIG_top_authors_volunteer_NGO=channel_outputs(an_native_allertameteoLIG_volunteer_NGO,param="top_authors",suffix_file="LIG_volunteer_NGO")

#####################################################################################

# "Institution"   "Weather"       "Media"         "Volunteer_NGO"

analitic_native_TOS_institution=analitic_native_TOS[which(vec_cat_TOS=="Institution"),]
analitic_native_TOS_weather=analitic_native_TOS[which(vec_cat_TOS=="Weather"),]
analitic_native_TOS_media=analitic_native_TOS[which(vec_cat_TOS=="Media"),]
analitic_native_TOS_volunteer_NGO=analitic_native_TOS[which(vec_cat_TOS=="Volunteer_NGO"),]

an_native_allertameteoTOS_institution=channel_analytic(analitic_native_TOS_institution,start_date=period_channels$start_date[1],end_date=period_channels$end_date[1],Ntop=10,only_original_tweet=TRUE)
an_native_allertameteoTOS_weather=channel_analytic(analitic_native_TOS_weather,start_date=period_channels$start_date[1],end_date=period_channels$end_date[1],Ntop=10,only_original_tweet=TRUE)
an_native_allertameteoTOS_media=channel_analytic(analitic_native_TOS_media,start_date=period_channels$start_date[1],end_date=period_channels$end_date[1],Ntop=10,only_original_tweet=TRUE)
an_native_allertameteoTOS_volunteer_NGO=channel_analytic(analitic_native_TOS_volunteer_NGO,start_date=period_channels$start_date[1],end_date=period_channels$end_date[1],Ntop=10,only_original_tweet=TRUE)

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native")

saveRDS(an_native_allertameteoTOS_institution,"an_native_allertameteoTOS_institution.rds")
saveRDS(an_native_allertameteoTOS_weather,"an_native_allertameteoTOS_weather.rds")
saveRDS(an_native_allertameteoTOS_media,"an_native_allertameteoTOS_media.rds")
saveRDS(an_native_allertameteoTOS_volunteer_NGO,"an_native_allertameteoTOS_volunteer_NGO.rds")

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native/TOS_out")

channel_TOS_stat_institution=channel_outputs(an_native_allertameteoTOS_institution,param="channel_stat",suffix_file="TOS_institution")
channel_TOS_daily_stat_institution=channel_outputs(an_native_allertameteoTOS_institution,param="daily_stat",suffix_file="TOS_institution")
channel_TOS_top_authors_institution=channel_outputs(an_native_allertameteoTOS_institution,param="top_authors",suffix_file="TOS_institution")

channel_TOS_stat_weather=channel_outputs(an_native_allertameteoTOS_weather,param="channel_stat",suffix_file="TOS_weather")
channel_TOS_daily_stat_weather=channel_outputs(an_native_allertameteoTOS_weather,param="daily_stat",suffix_file="TOS_weather")
channel_TOS_top_authors_weather=channel_outputs(an_native_allertameteoTOS_weather,param="top_authors",suffix_file="TOS_weather")

channel_TOS_stat_media=channel_outputs(an_native_allertameteoTOS_media,param="channel_stat",suffix_file="TOS_media")
channel_TOS_daily_stat_media=channel_outputs(an_native_allertameteoTOS_media,param="daily_stat",suffix_file="TOS_media")
channel_TOS_top_authors_media=channel_outputs(an_native_allertameteoTOS_media,param="top_authors",suffix_file="TOS_media")

channel_TOS_stat_volunteer_NGO=channel_outputs(an_native_allertameteoTOS_volunteer_NGO,param="channel_stat",suffix_file="TOS_volunteer_NGO")
channel_TOS_daily_stat_volunteer_NGO=channel_outputs(an_native_allertameteoTOS_volunteer_NGO,param="daily_stat",suffix_file="TOS_volunteer_NGO")
channel_TOS_top_authors_volunteer_NGO=channel_outputs(an_native_allertameteoTOS_volunteer_NGO,param="top_authors",suffix_file="TOS_volunteer_NGO")

################################################################################################################################################################


analitic_native_PIE_institution=analitic_native_PIE[which(vec_cat_PIE=="Institution"),]
analitic_native_PIE_weather=analitic_native_PIE[which(vec_cat_PIE=="Weather"),]
analitic_native_PIE_media=analitic_native_PIE[which(vec_cat_PIE=="Media"),]
analitic_native_PIE_volunteer_NGO=analitic_native_PIE[which(vec_cat_PIE=="Volunteer_NGO"),]

an_native_allertameteoPIE_institution=channel_analytic(analitic_native_PIE_institution,start_date=period_channels$start_date[1],end_date=period_channels$end_date[1],Nmin=10,Ntop=10,only_original_tweet=TRUE)
an_native_allertameteoPIE_weather=channel_analytic(analitic_native_PIE_weather,start_date=period_channels$start_date[1],end_date=period_channels$end_date[1],Ntop=10,only_original_tweet=TRUE)
an_native_allertameteoPIE_media=channel_analytic(analitic_native_PIE_media,start_date=period_channels$start_date[1],end_date=period_channels$end_date[1],Ntop=10,only_original_tweet=TRUE)
an_native_allertameteoPIE_volunteer_NGO=channel_analytic(analitic_native_PIE_volunteer_NGO,start_date=period_channels$start_date[1],end_date=period_channels$end_date[1],Nmin=10,Ntop=10,only_original_tweet=TRUE)

setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native")

saveRDS(an_native_allertameteoPIE_institution,"an_native_allertameteoPIE_institution.rds")
saveRDS(an_native_allertameteoPIE_weather,"an_native_allertameteoPIE_weather.rds")
saveRDS(an_native_allertameteoPIE_media,"an_native_allertameteoPIE_media.rds")
saveRDS(an_native_allertameteoPIE_volunteer_NGO,"an_native_allertameteoPIE_volunteer_NGO.rds")


setwd("/home/alf/Scrivania/lav_ubu_grasso/newanalisys/native/PIE_out")


channel_PIE_stat_institution=channel_outputs(an_native_allertameteoPIE_institution,param="channel_stat",suffix_file="PIE_insti_native")
channel_PIE_daily_stat_institution=channel_outputs(an_native_allertameteoPIE_institution,param="daily_stat",suffix_file="PIE_insti_native")
channel_PIE_top_authors_institution=channel_outputs(an_native_allertameteoPIE_institution,param="top_authors",suffix_file="PIE_inst_native")

channel_PIE_stat_weather=channel_outputs(an_native_allertameteoPIE_weather,param="channel_stat",suffix_file="PIE_weather_native")
channel_PIE_daily_stat_weather=channel_outputs(an_native_allertameteoPIE_weather,param="daily_stat",suffix_file="PIE_weather_native")
channel_PIE_top_authors_weather=channel_outputs(an_native_allertameteoPIE_weather,param="top_authors",suffix_file="PIE_weather_native")

channel_PIE_stat_media=channel_outputs(an_native_allertameteoPIE_media,param="channel_stat",suffix_file="PIE_media_native")
channel_PIE_daily_stat_media=channel_outputs(an_native_allertameteoPIE_media,param="daily_stat",suffix_file="PIE_media_native")
channel_PIE_top_authors_media=channel_outputs(an_native_allertameteoPIE_media,param="top_authors",suffix_file="PIE_media_native")

channel_PIE_stat_volunteer_NGO=channel_outputs(an_native_allertameteoPIE_volunteer_NGO,param="channel_stat",suffix_file="PIE_volNGO_native")
channel_PIE_daily_stat_volunteer_NGO=channel_outputs(an_native_allertameteoPIE_volunteer_NGO,param="daily_stat",suffix_file="PIE_volNGO_native")
channel_PIE_top_authors_volunteer_NGO=channel_outputs(an_native_allertameteoPIE_volunteer_NGO,param="top_authors",suffix_file="PIE_volNGO_native")

################################################################################################################################################################
