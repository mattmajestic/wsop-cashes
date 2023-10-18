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

wsop_url <- "https://www.wsop.com/players/profile/?playerid="

# Create a data frame to hold player IDs and names
player_data <- data.frame(
  ID = c(315691, 271, 267, 273),
  Name = c("Ben Steinwachs", "Phil Hellmuth", "Dnegs", "Phil Ivey")
)

ui <- navbarPage(
  title = "WSOP Cashes ♠️	♥ ♣ ♦ ",
  windowTitle = " ♠ WSOP Cashes",
  theme = shinytheme("yeti"),
  br(),
  h3("WSOP Cashes by Player ID"),
  h4("♠️	♥ ♣  ♦"),
  br(),
  br(),
  selectInput("wsop_name", "Select WSOP Player", choices = player_data$Name),
  DTOutput("wsop_dt")
)

server <- function(input, output, session) {
  rv <- reactiveValues(id = NULL)
  
  # Update the selected player ID based on the player's name
  observe({
    player_id <- player_data$ID[input$wsop_name == player_data$Name]
    rv$id <- player_id
  })
  
  # Render the data table
  output$wsop_dt <- renderDT({
    if (!is.null(rv$id)) {
      wsop_html <- read_html(paste0(wsop_url, rv$id))
      wsop_data <- wsop_html %>%
        html_nodes("body") %>%
        .[[1]] %>%
        html_table(fill = TRUE)
      datatable(wsop_data)
    }
  })
  
}

shinyApp(ui, server)