library(shiny)

shinyUI(pageWithSidebar(

  headerPanel("Which member of Team USA are you?"),

  sidebarPanel(
    selectInput("myAge",    label="Age (years)",      choices=seq(from=10, to=99), selected=30),
    selectInput("myHeight", label="Height (inches)",  choices=seq(from=48, to=84), selected=60),
    selectInput("myWeight", label="Weight (pounds)",  choices=seq(from=50, to=350), selected=150)
  ),

  mainPanel(
    htmlOutput("whoami")
  )
))