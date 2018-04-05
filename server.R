## server.R


server <- shinyServer(function(input, output, session) {
  
  # output$x1 = DT::renderDataTable(cars, server = FALSE)
  # 
  # output$x2 = DT::renderDataTable({
  #   sel <- input$x1_rows_selected
  #   if(length(cars)){
  #     cars[sel, ]
  #   }
  #   
  # }, server = FALSE) 
  
  
  output$x1 = DT::renderDataTable(lit, server = FALSE)
  
  # output$x2 = DT::renderDataTable({
  #   sel <- input$x1_rows_selected
  #   if(length(lit)){
  #     lit[sel, ]
  #   }
  #   
  # }, server = FALSE) 
  x <- c()

litOut <- reactive({

  sel <- input$x1_rows_selected
  x2 <- lit[sel, ]
  x <- rbind(x, x2)
  x <- data.frame(x)
  x$v1 = shinyInput(numericInput, nrow(x), 'v1_', value = 0)
  })
#   
   output$x3 <- DT::renderDataTable(litOut(), server = FALSE)
   
   output$downloadReport <- downloadHandler(
     filename = function() {
       paste('my-report', sep = '.', switch(
         input$format,HTML = 'html', Word = 'docx'
       ))
     },
     
     content = function(file) {
       src <- normalizePath('report.Rmd')
       
       # temporarily switch to the temp dir, in case you do not have write
       # permission to the current working directory
       owd <- setwd(tempdir())
       on.exit(setwd(owd))
       file.copy(src, 'report.Rmd', overwrite = TRUE)
       
       library(rmarkdown)
       out <- render('report.Rmd', switch(
         input$format,
          HTML = html_document(), Word = word_document()
       ))
       file.rename(out, file)
     }
   )

  
})



