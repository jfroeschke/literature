## ui.R
# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  fluidRow(
    column(6, DT::dataTableOutput('x1')),
    column(6, DT::dataTableOutput('x2')),
    column(6, DT::dataTableOutput('x3')),
    div(radioButtons('format', 'Document format', c('HTML', 'Word'),
                     inline = TRUE),
        downloadButton('downloadReport', label="Save summary report"),align="Center")
  )
  
)