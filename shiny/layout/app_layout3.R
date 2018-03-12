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
      fluidRow(
        column(6, plotOutput("hist", height = 200)),
        column(6, plotOutput("box", height = 200))
      ),
      fluidRow(
        column(6, offset = 3, plotOutput("plot", height = 200))
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
  
  output$box <- renderPlot({
    boxplot(dados(), main = "Boxplot de X~N(0,1)", horizontal = T,
            col = "lightblue", border = "steelblue")
  })
  output$plot <- renderPlot({
    plot(dados(), main = "X~N(0,1)", col = "lightblue", pch = 19, ylim = c(-5,5))
    abline(h = c(-3,3), lty = 3, col = 2)
  })
  
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

