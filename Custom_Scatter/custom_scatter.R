##########################################################
###
### Test plot of year to year state assessment MCAS scores
###
###########################################################

### Create test data

grade.3.mcas <- round(rnorm(100, mean=240, sd=10), digits=0)
grade.3.mcas[grade.3.mcas %% 2 == 1] = grade.3.mcas[grade.3.mcas %%2 == 1] + 1
grade.3.mcas[grade.3.mcas < 200] = 200
grade.3.mcas[grade.3.mcas > 280] = 280

noise.data <- rnorm(100, mean=0, sd=10)

grade.4.mcas <- round(grade.3.mcas + noise.data, digits=0)
grade.4.mcas[grade.4.mcas %% 2 == 1] = grade.4.mcas[grade.4.mcas %%2 == 1] + 1
grade.4.mcas[grade.4.mcas < 200] = 200
grade.4.mcas[grade.4.mcas > 280] = 280

mcas.data <- list(Content_Area="ELA", 
                  Data=data.frame(GRADE_3_SCALE_SCORE=grade.3.mcas, 
                                  GRADE_4_SCALE_SCORE=grade.4.mcas))


### Plot the data

pdf(file="mcas_scatter_3_to_4.pdf", width=6, height=6)
plot(x=mcas.data$Data$GRADE_3_SCALE_SCORE, 
     y=mcas.data$Data$GRADE_4_SCALE_SCORE,
     xlim=c(200,280), ylim=c(200,280),
     xlab=paste("Grade 3", mcas.data$Content_Area, sep=": "),
     ylab=paste("Grade 4", mcas.data$Content_Area, sep=": "),
     main=paste("Grade 3 versus Grade 4 MCAS", mcas.data$Content_Area, "Scores"),
     axes=FALSE
)

axis(1, at=seq(200, 280, by=20))
axis(2, at=seq(200, 280, by=20))
abline(h=240, lty=2, col="blue")
abline(v=240, lty=2, col="blue")
text(242, 205, labels="Proficient", srt=90, col="blue", cex=0.7)
text(238, 205, labels="Not Proficient", srt=90, col="blue", cex=0.7)

polygon(c(200, 220, 220, 200), c(200, 200, 280, 280), col=rgb(1, 0, 0, 0.3), border=rgb(1, 0, 0, 0.3))

points(mcas.data$Data$GRADE_3_SCALE_SCORE[mcas.data$Data$GRADE_3_SCALE_SCORE<=220],
       mcas.data$Data$GRADE_4_SCALE_SCORE[mcas.data$Data$GRADE_3_SCALE_SCORE<=220],
       pch=20, col="red")



dev.off() ### Turns pdf graphics device off




