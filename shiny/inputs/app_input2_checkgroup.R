library(shiny)

# UI
ui <- fluidPage(
   
  # input
  checkboxGroupInput(inputId = "opcoes",
                     label = "Estatísticas descritivas no gráfico:",
                     choices = c("Média", "Mediana", "Desvio-padrão"),
                     selected = c("Média", "Desvio-padrão")),
  
  # output
  plotOutput("grafico")
  
       
)

# SERVER
server <- function(input, output) {
   
  output$grafico <- renderPlot({
    # dados disponíves na base do R
    x <- cars[,1]
    plot(x, main = "Gráfico de dispersão da base cars")
    if("Média" %in% input$opcoes){
      abline(h = mean(x), col = "orangered", lty = 2)
      text(5, mean(x) + 1, "Média", col = "orangered")
    }
    if("Mediana" %in% input$opcoes){
      abline(h = median(x), col = "deepskyblue", lty = 3)
      text(45, median(x) - 1, "Mediana", col = "deepskyblue")
    }
    if("Desvio-padrão" %in% input$opcoes){
      abline(h = sd(x), col = "goldenrod", lty = 4)
      text(45, sd(x) + 1, "Desvio-padrão", col = "goldenrod")
    }
  })
  
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

