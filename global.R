library(httr)
library(XML)
library(dplyr)
library(magrittr)
library(xml2)
library(rvest)
library(iotools)
library(DT)
library(jsonlite)
library(shiny)
library(shinythemes)
library(shinyjs)

wsop_url <- "https://www.wsop.com/players/profile/?playerid="

# Create a data frame to hold player IDs and names
player_data <- data.frame(
  ID = c(315691, 271, 267, 273),
  Name = c("Ben Steinwachs", "Phil Hellmuth", "Dnegs", "Phil Ivey")
)

# Source all R scripts in the modules/ folder
module_files <- list.files("modules", pattern = "\\.R$", full.names = TRUE)
sapply(module_files, source)