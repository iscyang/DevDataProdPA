
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyServer(
  function(input, output) {
    r_month=reactive({input$r/12/100})
    n_payment=reactive({as.numeric(input$n)*12})
    output$payment <- renderPrint(
      {input$loan*1000*r_month()/(1-1/(1+r_month())^n_payment())}
    )
  }
)
