library(shiny)

ui <- fluidPage(
   
  
  fluidRow(
    column(6, 
           # input Nome
           textInput(inputId = "nome", label = "Nome:", value = ""),
           # input Idade
           numericInput(inputId = "idade", label = "Idade:", value = "", step = 1, min = 0, max = 100),
           # input Sexo
           radioButtons(inputId = "sexo", label = "Sexo:", choices = c("Feminino", "Masculino")
           ),
           # botão para ver a frase somente quando clicar
           actionButton("botao","Ver frase")
    ),
    column(6, textOutput("resposta")) # output frase
  )
  
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  output$resposta <- renderText({
    
    # colocar o input$botao e a função isolate permite que a frase seja atualizada) 
    # somente após eu clicar no botão
    
    input$botao
    isolate({
      
      if(input$botao != 0){ # esse if permite que se eu ainda não cliquei no botão, nada apareça
        if(input$sexo == "Feminino"){
          paste0("Querida ", input$nome,", daqui a 2 anos você terá ", input$idade + 2, " anos de idade.")
        }else{
          paste0("Querido ", input$nome,", daqui a 2 anos você terá ", input$idade + 2, " anos de idade.")
        }
      }
      
    }) # fim do isolate
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

