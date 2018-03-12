library(shiny)

# UI
ui <- fluidPage(
   
  # input
  sliderInput(inputId = "slider", label = "Selecione um número",
              min = 0, max = 100, step = 0.01, value = 50)
       
)

# SERVER
server <- function(input, output) {
   
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

