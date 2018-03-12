library(shiny)
library(shinydashboard)

# UI
ui <- dashboardPage(skin = "blue",
                    
                    dashboardHeader(title = "Novo Shiny"),
                    
                    dashboardSidebar(
                      sidebarMenu(
                        menuItem("Menu1", icon = icon("hand-spock-o"), tabName = "tab_menu1"),
                        menuItem("Menu2", icon = icon("hand-peace-o"),
                                 menuSubItem("submenu1", tabName = "tab_submenu1"),
                                 menuSubItem("submenu2", tabName = "tab_submenu2")
                        )
                      )
                    ),
                    
                    dashboardBody(
                      tabItems(
                        tabItem(tabName = "tab_menu1", "Conteúdo Menu1"),
                        tabItem(tabName = "tab_submenu1", "Conteúdo submenu1"),
                        tabItem(tabName = "tab_submenu2", "Conteúdo submenu2")
                      )
                    )
                    
)


# SERVER
server <- function(input, output) {
}

# Executar a aplicação
shinyApp(ui = ui, server = server)

