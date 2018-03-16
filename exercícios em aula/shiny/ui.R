shinyUI(
  fluidPage(title = "Formulário",
            
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
)
