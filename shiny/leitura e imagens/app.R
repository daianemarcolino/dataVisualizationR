library(shiny)
dados <- readRDS("data/meus_dados.rds")

# UI
ui <- fluidPage(
   
  # output
  plotOutput("grafico"),
  
  # código para aparecer uma imagem
  div(img(src = "img_maneira.png", width = "50%"), style = "text-align: center"),
  
  br(), br(),
  
  # código para baixar um arquivo
  a(href = "pdf_interessante.pdf", "Clique aqui", target="_blank"), "parar baixar um pdf interessante."
     
)

# SERVER
server <- function(input, output) {
   
  output$grafico <- renderPlot({
    plot(dados)
  })
  
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

