library(shiny)

source("global.R")
source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server, options = list(port = 3838))