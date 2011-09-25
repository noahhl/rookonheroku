### R code from vignette source 'saveload.Snw'

###################################################
### code chunk number 1: saveload.Snw:18-22
###################################################
library(grDevices)
library(grid)
ps.options(pointsize = 12)
options(width = 60)


###################################################
### code chunk number 2: saveload.Snw:49-51
###################################################
gt <- textGrob("hi")
save(gt, file = "mygridplot")


###################################################
### code chunk number 3: saveload.Snw:55-57
###################################################
load("mygridplot")
grid.draw(gt)


###################################################
### code chunk number 4: saveload.Snw:90-93
###################################################
grid.grill()
temp <- recordPlot()
save(temp, file = "mygridplot")


###################################################
### code chunk number 5: saveload.Snw:100-102
###################################################
load("mygridplot")
temp


