wsop_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    # Render the data table
    output$wsop_dt <- renderDT({
      player_id <- player_data$ID[input$wsop_name == player_data$Name]
      if (length(player_id) > 0) {
        wsop_html <- read_html(paste0(wsop_url, player_id))
        wsop_data <- wsop_html %>%
          html_nodes("body") %>%
          .[[1]] %>%
          html_table(fill = TRUE)
        datatable(wsop_data)
      }
    })
    
    observeEvent(input$stop_btn, {
      # Call the stopSnowstorm JavaScript function when the button is clicked
      runjs("stopSnowstorm();")
      updateActionButton(session, "stop_btn", label = "Stopped SnowStorm Javascript")
    })
  })
}
