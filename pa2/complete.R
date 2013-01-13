complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

        count.completes <- function(fn) {
            x<-read.csv(fn)
            nrow(x[!is.na(x$sulfate) & !is.na(x$nitrate),])
        }


	filenames <- sapply(id, function(i) sprintf('%s/%03d.csv', directory, as.integer(i)))
        n <- sapply(filenames, count.completes, USE.NAMES=FALSE)
        data.frame(id=id, nobs=n)
}
