## server.R


server <- shinyServer(function(input, output, session) {
  
  output$x1 = DT::renderDataTable(cars, server = FALSE)
  
  output$x2 = DT::renderDataTable({
    sel <- input$x1_rows_selected
    if(length(cars)){
      cars[sel, ]
    }
    
  }, server = FALSE)  
}
)