server <- function(input, output, session) {
  rv <- reactiveValues(id = NULL,cashes = data.frame())
  wsop_server("wsop_module")
}