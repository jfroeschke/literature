## ui.R
# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  fluidRow(
    column(6, DT::dataTableOutput('x1')),
    column(6, DT::dataTableOutput('x2'))
  )
  
)