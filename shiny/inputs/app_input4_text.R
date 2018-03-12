library(shiny)

# UI
ui <- fluidPage(
   
  # textInput
  textInput(inputId = "texto",
            label = "Olá! Tudo bem?",
            value = "Sim"),
  
  # numericInput
  numericInput(inputId = "numero",
               label = "Escolha um número de 0 a 10",
               value = 3, step = 0.5,
               min = 0,
               max = 10),
  
  # passwordInput
  passwordInput(inputId = "senha",
                label = "Digite sua senha")
       
)

# SERVER
server <- function(input, output) {
   
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

