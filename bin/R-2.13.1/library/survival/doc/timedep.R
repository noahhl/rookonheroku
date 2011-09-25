### R code from vignette source 'timedep.Rnw'

###################################################
### code chunk number 1: preamble
###################################################
options(width=60, continue=" ")
makefig <- function(file, top=1, right=1, left=4) {
    pdf(file, width=9.5, height=7, pointsize=18)
    par(mar=c(4, left, top, right) +.1)
    }
library(survival)


###################################################
### code chunk number 2: timedep.Rnw:75-77 (eval = FALSE)
###################################################
## fit <- coxph(Surv(time1, time2, status) ~ age + creatinine, 
##              data=mydata)


###################################################
### code chunk number 3: timedep.Rnw:153-186
###################################################
cgdname <- c("id", "center", "random.dt", "trt", "sex", "age", 
             "height", "weight", "inheritance", "steroids", 
             "antibiotic", "inst", "futime", paste("e", 1:7, sep=''))
cgd1 <- read.table('cgd.dat', header=F, fill=T, col.names=cgdname,
                   colClasses=c("integer", "integer", "character",
                                rep("integer", 3), rep("numeric",2),
                                rep("integer", 12)))

cgd1$ninfect <- rowSums(!is.na(as.matrix(cgd1[,14:20])))
cgd1$random.dt <- as.Date(cgd1$random.dt, format="%m%d%y")
cgd1$sex <- factor(cgd1$sex, labels=c("M", "F"))
cgd1$inst <- factor(cgd1$inst, labels=c("NIH", "US-Other", 
                          "Amsterdam", "Europe-Other"))

temp <- apply(as.matrix(cgd1[,13:20]), 1, function(x) {
    z <- as.vector(x[!is.na(x)])
    if (length(z)==1) cbind(0, z, 0)
    else {
        temp <- cbind(c(0, z[-1]), 
                      c(z[-1], z[1]), 
                      c(rep(1, length(z)-1), 0))
        if (z[1]== z[length(z)]) temp[-nrow(temp),]
        else temp
    }})

index <- rep(1:nrow(cgd1), unlist(lapply(temp, nrow)))
cgd2 <- data.frame( cgd1[index, 1:12], 
                   time1= unlist(lapply(temp, function(x) x[,1])), 
                   time2= unlist(lapply(temp, function(x) x[,2])), 
                   event= unlist(lapply(temp, function(x) x[,3])), 
                   enum = unlist(lapply(temp, function(x) 1:nrow(x))))
cfit <- coxph(Surv(time1, time2, event) ~ trt + sex + age +
               inheritance + cluster(id), data=cgd2)


###################################################
### code chunk number 4: timedep.Rnw:260-268
###################################################
load('raheart.rda')
age2 <- tcut(raheart$agechf*365.25, 0:110* 365.25, labels=0:109)
rowid <- 1:nrow(raheart)
pfit <- pyears(Surv(startday, stopday, hospevt) ~ age2 + rowid,
               data=raheart, data.frame=TRUE, scale=1)
print(pfit$offtable)
pdata <- pfit$data
print(pdata[1:6,])


###################################################
### code chunk number 5: timedep.Rnw:297-314
###################################################
index <- as.integer(pdata$rowid)
lagtime <- c(0, pdata$pyears[-nrow(pdata)])
lagtime[1+ which(diff(index)==0)] <- 0 #starts at 0 for each subject
temp <- raheart$startday[index] + lagtime  #start of each new interval
data2 <- data.frame(raheart[index,], 
                    time1= temp,
                    time2= temp + pdata$pyears,
                    event= pdata$event,
                    age2=  1+ as.numeric(pdata$age2) )

afit1 <- coxph(Surv(startday, stopday, hospevt) ~ male + pspline(agechf), 
               data=raheart)
afit2 <- coxph(Surv(time1, time2, event) ~ male + pspline(age2), data2)
#termplot(afit1, terms=2, se=TRUE, xlab="Age at Diagnosis of CHF")
#termplot(afit2, terms=2, se=TRUE, xlab="Current Age")

table(with(raheart, tapply(hospevt, patid, sum)))


###################################################
### code chunk number 6: timedep.Rnw:330-334
###################################################
afit2b <- coxph(Surv(startday, stopday, hospevt) ~ male + tt(agechf),
                data=raheart, 
                tt=function(x, t, ...) pspline(x + t/365.25))
afit2b


###################################################
### code chunk number 7: timedep.Rnw:360-367
###################################################
function(x, t, riskset, weights){ 
    obrien <- function(x) {
        r <- rank(x)
        (r-.5)/(.5+length(r)-r)
    }
    unlist(tapply(x, riskset, obrien))
}


###################################################
### code chunk number 8: timedep.Rnw:377-379
###################################################
function(x, t, riskset, weights) 
    unlist(tapply(x, riskset, rank))


