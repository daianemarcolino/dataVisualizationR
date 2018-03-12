library(shiny)
library(plotly)
library(dygraphs)

# UI
ui <- fluidPage(
   
  # outputs
  fluidRow(
    column(6, plotlyOutput("grafico1", height = 300)),
    column(6, dygraphOutput("grafico2", height = 300))
  )
  
)

# SERVER
server <- function(input, output) {
   
  output$grafico1 <- renderPlotly({
    plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, symbol = ~Species)
  })
  
  output$grafico2 <- renderDygraph({
    dygraph(AirPassengers) %>%
      dySeries("V1", label = "AirPassengers", color = "#000000") %>%
      dyRangeSelector() %>%
      dyLegend(labelsSeparateLines = T, show = "always")
  })
  
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

