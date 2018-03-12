library(shiny)

# UI
ui <- fluidPage(
   
  # input
  dateInput(inputId = "data",
            label = "Selecione uma data:",
            min = "1900-01-01",
            max = "2017-12-12")
       
)

# SERVER
server <- function(input, output) {
   
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

