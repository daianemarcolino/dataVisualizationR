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
      plotOutput("hist", height = 300)
    )
  )
  
)

# SERVER
server <- function(input, output) {
   
  output$hist <- renderPlot({
    set.seed(1)
    x <- rnorm(input$obs, 0,1)
    hist(x, main = "Histograma de X~N(0,1)", col = "lightblue", border = "steelblue")
  })
  
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

