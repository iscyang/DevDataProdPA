
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(
  pageWithSidebar(
  
    # Application title
    headerPanel("Mortgage payment calculator"),
    
    # Sidebar with a slider input for number of observations
    sidebarPanel(
      sliderInput("loan",
                  "Total loan amount ($1,000):", 
                  min = 100, 
                  max = 1000, 
                  value =500,
                  step=10),
      sliderInput("r", 
                  "Interest rate (APR%):", 
                  min = 3, 
                  max = 6, 
                  value = 4,
                  step=0.1),
      selectInput("n",
                  "Loan term (years):",
                  choices = c(15, 30),
                  selected = 30)
    ),
    # Show a plot of the generated distribution
    mainPanel(
      h4('Monthly payment is (in unit of US dollar $)'),
      verbatimTextOutput("payment"),
      h4('Help:'),
      p("There are many different types of mortgages."),
      p("  This application only computes the common fixed interest-rate, 15/30 years, fixed payment mortgage."),
      br(),
      p("  The loan amount is entered through the first sliding bar."),
      p("  It is limited in the range of $100,000 to $1,000,000, with $10,000 step size."),
      p("  The interest rate is also entered through the sliding bar."),
      p("  The loan term, 15 or 30 years, is set by the drop-down menu."),
      br(),
      p("  The system will tell the monthly payment for this mortgage on the above result field."),
      br(),
      h4('Disclaimer'),
      p("  Please note that even I have done my due diligence checking the correctness of this formula, I
        am not sure if it outputs the correct answer all the time.  Sometime, the bank seems charging higher
        with some wierd fee."),
      p("  Therefore, it is recommended to check with your lender before signing any mortgage document.")
    )
  )
)
