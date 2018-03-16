shinyServer(function(input, output){
  
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
  
})