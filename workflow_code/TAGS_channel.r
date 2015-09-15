options(java.parameters = "-Xmx4g" )

library(XLConnect)

setwd("/home/alf/Scrivania/lav_ubu_grasso")


allertameteoTOS_TAGS=readWorksheetFromFile("allertameteoTOS_TAGS v6.0ns.xlsx",sheet=2)


# [1] "id_str"                    "from_user"                 "text"                      "created_at"                "time"                     
# [6] "geo_coordinates"           "user_lang"                 "in_reply_to_user_id_str"   "in_reply_to_screen_name"   "from_user_id_str"         
# [11] "in_reply_to_status_id_str" "source"       

allertameteoTOS_TAGS=readRDS("allertameteoTOS_TAGS.rds")


allertameteoTOS_TAGS$source=gsub("<([[:alpha:]][[:alnum:]]*)(.[^>]*)>([.^<]*)","", allertameteoTOS_TAGS$source)
allertameteoTOS_TAGS$source=gsub("</a>","", allertameteoTOS_TAGS$source)
source_tw_allertameteoTOS=as.data.frame.array(table(allertameteoTOS_TAGS$source))
names(source_tw_allertameteoTOS)=c("freq")
source_tw_allertameteoTOS$source=rownames(source_tw_allertameteoTOS)
rownames(source_tw_allertameteoTOS)<-NULL
allertameteoTOS_TAGS$data=as.Date(allertameteoTOS_TAGS$time)
allertameteoTOS_TAGS$id=as.numeric(allertameteoTOS_TAGS$id_str)
allertameteoTOS_TAGS$lang=allertameteoTOS_TAGS$user_lang

source_tw_allertameteoTOS=source_tw_allertameteoTOS[order(-source_tw_allertameteoTOS$freq),]
write.csv(source_tw_allertameteoTOS,"source_tw_allertameteoTOS.csv",row.names = FALSE)

saveRDS(allertameteoTOS_TAGS,"allertameteoTOS_TAGS.rds")
