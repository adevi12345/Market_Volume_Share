

# List of Packages to be use
packages <-
  c("shiny",
    "shinydashboard",
    "dplyr",
    "ggthemes","DT","ggplot2","rmarkdown")

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())

if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# Packages loading
invisible(lapply(packages, library, character.only = TRUE))


ui <- fluidPage(
  market_ui("graphs_output")
  )

server <- function(input, output, session) {
  market_server("graphs_output")
}

shinyApp(ui, server)
