corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

        count.corr <- function(fn) {
            x <- read.csv(fn)
            ndos <- nrow(x[!is.na(x$sulfate) & !is.na(x$nitrate),])
            correlation <- cor(x$sulfate, x$nitrate, use="pairwise.complete.obs")
            c(ndos, correlation)
        }

        filenames <- list.files(directory, full.names=TRUE)
        x <- sapply(filenames, count.corr, USE.NAMES=FALSE)
        x[2, x[1,] > threshold]
}
