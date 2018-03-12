library(shiny)

# UI
ui <- fluidPage(
   
  # outputs
  fluidRow(
    column(width = 5, verbatimTextOutput("print")),
    column(width = 4, "Quanto é 2 + 2?", textOutput("text")),
    column(width = 3, align = "center", tableOutput("tabela"))
  )
  
)

# SERVER
server <- function(input, output) {
   
  output$print <- renderPrint({
    list(head(cars), summary(cars))
  })
  
  output$text <- renderText({
    2 + 2
  })
  
  output$tabela <- renderTable({
    head(cars)
  })
  
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

