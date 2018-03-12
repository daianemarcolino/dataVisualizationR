library(shiny)
library(plotly)
library(dygraphs)

# UI
ui <- fluidPage(
  
  # plots
  fluidRow(
    column(width = 6, plotOutput("grafico1")),
    column(width = 6, plotOutput("grafico2"))
  ),
  
  br(),br(),
  
  # plotly e dygraphs
  fluidRow(
    column(6, plotlyOutput("grafico3", height = 300)),
    column(6, dygraphOutput("grafico4", height = 300))
  ),
  
  br(),br(),
  
  # textos e tabelas
  fluidRow(
    column(width = 5, verbatimTextOutput("print")),
    column(width = 4, "Quanto é 2 + 2?", textOutput("text")),
    column(width = 3, align = "center", tableOutput("tabela"))
  )
)

# SERVER
server <- function(input, output) {
  
  output$grafico1 <- renderPlot({
    boxplot(cars[,1], col = "salmon", main = "Gráfico 1")
  })
  
  output$grafico2 <- renderPlot({
    prop <- c(sum(cars[,1] > 10), sum(cars[,1] <= 10))/length(cars[,1])*100
    pie(prop, col = c("lightblue","white"), main = "Gráfico 2",
        labels = paste0(prop,"%"), border = "steelblue")
    legend("topleft", fill = c("lightblue", "white"), col = c("lightblue", "white"),
           legend = c("Categoria 1", "Categoria 2"), bty = "n")
  })
  
  output$print <- renderPrint({
    list(head(cars), summary(cars))
  })
  
  output$text <- renderText({
    2 + 2
  })
  
  output$tabela <- renderTable({
    head(cars)
  })
  
  output$grafico3 <- renderPlotly({
    plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, symbol = ~Species)
  })
  
  output$grafico4 <- renderDygraph({
    dygraph(AirPassengers) %>%
      dySeries("V1", label = "AirPassengers", color = "#000000") %>%
      dyRangeSelector() %>%
      dyLegend(labelsSeparateLines = T, show = "always")
  })
  
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

