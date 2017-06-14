#create new directory 'Air_Pollution'

if(!file.exists("specdata")){
        dir.create("specdata")
}

#downloadfile from website

fileURL<-"https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(fileURL, destfile = "./specdata/specdata.zip", method = "curl")
list.files("./specdata")

#unzip file
unzip("./specdata/specdata.zip")

#============PART ONE=======pollutantmean function=======

pollutantmean<- function(directory, pollutant, id = 1:332){
        fileList <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
        values <- numeric()
        
        for (i in id){
                data <- read.csv(fileList[i])
                values <- c(values, data[[pollutant]])
        }
        mean(values, na.rm = TRUE)
}
