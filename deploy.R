rm(list=ls())
library(shiny)
library(shinyapps)
library(rsconnect)

setwd('~/github/olympic2016-shiny')
rsconnect::setAccountInfo(name='name', token='token', secret='secret')

deployApp(appFiles=c('ui.R', 'server.R', 'athletes_shiny.csv'))
# runApp()
