library(shiny)

# UI
ui <- fluidPage(
   
  # selectInput
  selectInput(inputId = "lista1",
              label = "Selecine um item nessa lista",
              choices = c("Item 1", "Item 2", "Item 3"),
              multiple = F),
  
  # mais um selectInput
  selectInput(inputId = "lista2",
              label = "Selecine um item ou mais nessa lista",
              choices = c("Item 1", "Item 2", "Item 3"),
              multiple = T, selectize = F)
       
)

# SERVER
server <- function(input, output) {
   
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

