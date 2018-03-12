library(shiny)

# UI
ui <- fluidPage(
   
  # checkbox
  checkboxInput(inputId = "checkbox",
                label = "única opção",
                value = TRUE),
  
  # checkboxGroupInput
  checkboxGroupInput(inputId = "checkbox_multiplas",
                     label = "checkboxGroupInput:",
                     choices = c("opção1", "opção2", "opção3"),
                     selected = c("opção2", "opção3")),
  
  # dateInput
  dateInput(inputId = "data",
            label = "Selecione uma data:",
            min = "1900-01-01",
            max = "2017-12-12"),
  
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
                label = "Digite sua senha"),
  
  # selectInput
  selectInput(inputId = "lista1",
              label = "Selecione um item nessa lista",
              choices = c("Item 1", "Item 2", "Item 3"),
              multiple = F),
  
  # mais um selectInput
  selectInput(inputId = "lista2",
              label = "Selecione um item ou mais nessa lista",
              choices = c("Item 1", "Item 2", "Item 3"),
              multiple = T, selectize = F),
  
  # sliderInput
  sliderInput(inputId = "slider", label = "Selecione um número",
              min = 0, max = 100, step = 0.01, value = 50),
  
  # actionButton
  actionButton(inputId = "botao", label = "actionButton"),

  # actionLink
  actionLink(inputId = "link", label = "actionLink")
       
)

# SERVER
server <- function(input, output) {

}

# Executar a aplicação
shinyApp(ui = ui, server = server)

