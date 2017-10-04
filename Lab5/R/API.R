library(httr)
library(jsonlite)

func1<-function(origin,destination){
  stopifnot(is.character(origin)==T || is.character(destination)==T)
  destination<-gsub(pattern = " ",replacement = "",destination)
  origin<-gsub(pattern = " ",replacement = "",origin)
  url1<-"https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins="
  url1<-paste(url1,origin,"&destinations=",destination,"&key=AIzaSyB47VpiErStMPVbFHQxueDYN0-hnDu4l-U",sep = "",collapse = NULL)
  sample1<-fromJSON(url1,flatten = TRUE)
  des.out<-sample1$destination_addresses
  ori.out<-sample1$origin_addresses
  num.out<-unlist(sample1[3])
  names(num.out)<- NULL
  return(cat(" The distance between \n",ori.out,"\n and \n",des.out," is ",num.out[2],"\n and the rough time taken for travel is ",num.out[4]))
}