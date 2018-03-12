library(shiny)

# UI
ui <- fluidPage(
   
  # actionButton
  actionButton(inputId = "botao", label = "Clique Aqui"),
  
  br(), br(),
  
  # actionLink
  actionLink(inputId = "link", label = "Clique Aqui")
       
)

# SERVER
server <- function(input, output) {
   
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

