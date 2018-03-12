shinyServer(function(input, output) {
   
  output$grafico <- renderPlot({
    plot(dados)
  })
  
})
