library(shiny)

# UI
ui <- fluidPage(
   
  br(),br(),
  sidebarLayout(
    sidebarPanel(
      "Escolha o número de observações e observe o histograma ao lado.",
      br(), br(),
      sliderInput("obs",
                  "Número de observações",
                  min = 0,
                  max = 1000,
                  value = 500)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Histograma",
                 plotOutput("hist", height = 300)
        ),
        tabPanel("Estatísticas Descritivas",
                 br(),
                 verbatimTextOutput("estat")
        )
      )
    )
  )
  
)

# SERVER
server <- function(input, output) {
   
  dados <- reactive({
    set.seed(1)
    x <- rnorm(input$obs, 0,1)
    x
  })
  
  output$hist <- renderPlot({
    hist(dados(), main = "Histograma de X~N(0,1)", col = "lightblue", border = "steelblue")
  })
  
  output$estat <- renderPrint({
    summary(dados())
  })
  
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

