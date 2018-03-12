library(shiny)

# UI
ui <- fluidPage(
   
  # outputs
  fluidRow(
    column(width = 6, plotOutput("grafico1")),
    column(width = 6, plotOutput("grafico2"))
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
  
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

