# World Series of Poker Cashes 🃏💰

Explore World Series of Poker cashes by player ID.

## R Shiny Notes

Shiny App Demo: https://mmajestic.shinyapps.io/wsop-cashes/

R Shiny is an R framework for building web applications. One of the best practices in R Shiny development is to use modules, which help streamline your ui and server files. The benefits of using modules include:

- `Cleaner Code`: Modules help organize code, making it more readable and maintainable.
- `Simpler Collaboration`: Smaller, modular files make it easier for multiple developers to work together.
- `Easier Debugging`: Debugging smaller modules is more straightforward than debugging a large, monolithic server file.

### Modules Example

To see an example of this structure, review the following files in a basic web scraping project for Poker Cashes across WSOP Circuits:

- `ui.R`: Sources the wsopUI function to create the UI components.
- `server.R`: Sources the wsopServer function to handle server logic.
- `global.R`: loop through the modules directory to have the functions in R's global.
- `modules/wsop_ui.R`: Defines the UI elements for the module.
- `modules/wsop_server.R`: Implements the server-side logic for the module.

### JavaScript Example

There a simple snowstorm.js in the `www` directory that is then enabled in `modules/wsop_ui.R` with `tags$head(tags$script(src = "snowstorm.js"))` that adds a snowfall effect to the page.  

To further interact with JS from R Shiny, `shinyjs` can be used to do an action like 

```
observeEvent(input$stop_btn, {
    runjs("stopSnowstorm();")
    updateActionButton(session, "stop_btn", label = "Stopped SnowStorm Javascript")
  })
```

## DockerHub Image

You can pull the Docker image for this project from DockerHub:

### R Shiny Image

[![Docker Image](https://img.shields.io/docker/v/mattmajestic/wsop-cashes?color=blue&label=mattmajestic/wsop-cashes&logo=docker&logoColor=white&style=for-the-badge)](https://hub.docker.com/r/mattmajestic/wsop-cashes)

### Streamlit Image
[![Docker Image](https://img.shields.io/docker/v/mattmajestic/wsop-cashes-streamlit?color=blue&label=mattmajestic/wsop-cashes-streamlit&logo=docker&logoColor=white&style=for-the-badge)](https://hub.docker.com/r/mattmajestic/wsop-cashes-streamlit)

## More on YouTube Channel 📺🃏

[![Subscribe on YouTube](https://img.shields.io/badge/Subscribe-red)](https://www.youtube.com/@majesticcoding) 
