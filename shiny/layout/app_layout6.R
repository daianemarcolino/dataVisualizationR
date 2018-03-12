library(shiny)
library(shinythemes)

# UI
ui <- navbarPage(":)", theme = shinytheme("spacelab"),
                 tabPanel("Menu1", "Conteúdo Menu1"),
                 tabPanel("Menu2", "Conteúdo Menu2"),
                 navbarMenu("Menu3",
                            tabPanel("Opção1", "Conteúdo Opção1"),
                            tabPanel("Opção2", "Conteúdo Opção2")
                 )
)

# SERVER
server <- function(input, output) {
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

