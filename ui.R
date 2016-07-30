library(shiny)

shinyUI(pageWithSidebar(

  headerPanel(""),

  sidebarLayout(
    sidebarPanel(
      selectInput("myGender", label="Gender",           choices=c("M", "F"),         selected="F"),
      selectInput("myAge",    label="Age (years)",      choices=seq(from=10, to=99), selected=30),
      selectInput("myHeight", label="Height (inches)",  choices=seq(from=48, to=84), selected=60),
      selectInput("myWeight", label="Weight (pounds)",  choices=seq(from=50, to=350), selected=150),
      width=4
    ),

    mainPanel(
      htmlOutput("whoami"),
      width=8
    )
  ),

  mainPanel()


))