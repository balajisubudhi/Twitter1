library("twitteR")
list.of.packages <- c("shiny","ggmap","googleVis")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
lapply(list.of.packages,function(x){library(x,character.only=TRUE)})

#load twitter auth
setwd("C:\\Users\\balaji.subudhi\\Desktop\\Desktop\\schnider")
load("twitter authentication.Rdata")
registerTwitterOAuth(cred)

# function to fetch data
TweetFrame<-function(searchTerm, maxTweets)
{
	twtList<-searchTwitter(searchTerm,n=maxTweets,cainfo="cacert.pem",lang="en")
	twtList1<- do.call("rbind",lapply(twtList,as.data.frame))
	twtList1$text<-iconv(twtList1$text, 'UTF-8', 'ASCII') #WILL THIS SOLVE THE UTF ENCODING PROBLEM: http://lists.hexdump.org/pipermail/twitter-users-hexdump.org/2013-May/000335.html
	return(twtList1)
}

data=TweetFrame("RCB",50)


