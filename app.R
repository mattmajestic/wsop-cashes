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
library(qrcode)

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
  column(
    4,
    selectInput("wsop_name", "Select WSOP Player", choices = player_data$Name),
    actionButton("show_qrcode", "Show QR Code"),
    plotOutput("qrcode", width = "100%", height = "400px")
  ),
  column(8, DTOutput("wsop_dt")),
  br()
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
  
  # Render the QR code when the button is clicked
  observeEvent(input$show_qrcode, {
    if (!is.null(rv$id)) {
      p <- qrcode_gen(paste0(wsop_url, rv$id), dataOutput = TRUE)
      output$qrcode <- renderPlot({
        heatmap(
          p[nrow(p):1, ],
          Rowv = NA,
          Colv = NA,
          scale = "none",
          col = c("black", "white"),
          labRow = "",
          labCol = ""
        )
      })
    }
  })
  
}

shinyApp(ui, server)