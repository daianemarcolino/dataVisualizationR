library(shiny)

# UI
ui <- fluidPage(
   
  # input
  checkboxInput(inputId = "check_titulo",
                label = "Mostrar título do gráfico",
                value = TRUE),
  
  # output
  plotOutput("histograma")
  
       
)

# SERVER
server <- function(input, output) {
   
  output$histograma <- renderPlot({
    # dados disponíves na base do R
    x <- cars[,1]
    if(input$check_titulo){
      hist(x, main = "Histograma da base cars", border = "white", col = "deepskyblue")
    }else{
      hist(x, main = "", border = "white", col = "deepskyblue")
    }
  })
  
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

