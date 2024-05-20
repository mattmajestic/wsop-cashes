wsop_ui <- function(id) {
  ns <- NS(id)
  navbarPage(
    title = "WSOP Cashes ♠️ ♥ ♣ ♦",
    windowTitle = " WSOP Cashes",
    theme = shinytheme("cyborg"),
    useShinyjs(),  
    tags$head(
      tags$script(src = "snowstorm.js"),
      tags$link(rel = "icon", type = "image/svg+xml", href = "vercel.svg"),
      tags$script(HTML("
        function stopSnowstorm() {
          if (typeof snowStorm !== 'undefined') {
            snowStorm.stop();
          }
        }
      "))
    ),
    
    tabPanel(
      actionButton(ns("stop_btn"), "Stop Snowstorm JavaScript"),
      br(),
      h3("WSOP Cashes by Player ID"),
      h4("♠️ ♥ ♣  ♦"),
      br(),
      br(),
      selectInput(ns("wsop_name"), "Select WSOP Player", choices = player_data$Name),
      DTOutput(ns("wsop_dt"))
    )
  )
}
