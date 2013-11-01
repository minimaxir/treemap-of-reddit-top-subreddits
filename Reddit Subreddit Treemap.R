# Not run:
#
#
#
#
# library("RSQLite")
#
# drv <- dbDriver("SQLite")
# con <- dbConnect(drv, "Max Woolf's Awesome Database")
#
# reddit_top_subreddits <- dbGetQuery(con,"SELECT subreddit, COUNT(subreddit) FROM links GROUP BY subreddit ORDER BY COUNT(subreddit) DESC LIMIT 500")
#
# reddit_count_all <- unlist(dbGetQuery(con,"SELECT COUNT(*) FROM links"))
#
# reddit_top_perc <- data.frame(subreddit=reddit_top_subreddits[,1],count=reddit_top_subreddits[,2], perc_all=reddit_top_subreddits[,2]/reddit_count_all)

# write.csv(reddit_top_perc,"reddit_top_perc.csv",row.names=F)

library("treemap")

reddit_top_perc <- read.csv("reddit_top_perc.csv",header=T,nrows=100)

png("treemap.png",width=1600,height=1200)

treemap(reddit_top_perc, index="subreddit",vSize="perc_all",palette="-Blues",fontsize.labels=30,lowerbound.cex.labels=.1, title="Relative Sizes of the Top 100 Subreddits by # Submissions",type="dens",position.legend="none")

dev.off()