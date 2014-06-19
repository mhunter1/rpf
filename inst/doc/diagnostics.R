
## ----, cache=FALSE, include=FALSE----------------------------------------
library(knitr)
library(rpf)
library(ggplot2)
library(reshape2)
library(gridExtra)
opts_chunk$set(echo=TRUE)


## ------------------------------------------------------------------------
spec <- list()
spec[1:6] <- rpf.grm(factors=2)
gen.param <- sapply(spec, rpf.rparam)
colnames(gen.param) <- paste("i", 1:ncol(gen.param), sep="")
gen.param[2,] <- c(0,0,.5,.5,1,1)

resp <- rpf.sample(1000, spec, gen.param)

# hide latent factor that we don't know about
tspec <- list()
tspec[1:length(spec)] <- rpf.grm(factors=1)

grp <- list(spec=tspec, param=gen.param[-2,], mean=c(0), cov=diag(1), data=resp)

ChenThissen1997(grp)


## ------------------------------------------------------------------------
SitemFit(grp)


## ------------------------------------------------------------------------
sumScoreEAP(grp)


## ------------------------------------------------------------------------
  data(science)
  spec <- list()
  spec[1:25] <- rpf.nrm(outcomes=3, T.c = lower.tri(diag(2),TRUE) * -1)
  param <- rbind(a=1, alf1=1, alf2=0,
        gam1=sfif$MEASURE + sfsf[sfsf$CATEGORY==1,"Rasch.Andrich.threshold.MEASURE"],
        gam2=sfif$MEASURE + sfsf[sfsf$CATEGORY==2,"Rasch.Andrich.threshold.MEASURE"])
  colnames(param) <- sfif$NAME
  iorder <- match(sfif$NAME, colnames(sfpf))
  responses <- sfpf[,iorder]
  rownames(responses) <- sfpf$NAME
  
  rpf.1dim.fit(spec, param, responses, sfpf$MEASURE, 2, wh.exact=TRUE)
  head(rpf.1dim.fit(spec, param, responses, sfpf$MEASURE, 1, wh.exact=TRUE))

