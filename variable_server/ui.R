library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Linear regression for two continuous variables."), 
  
  sidebarPanel(
    fileInput(inputId="files", label=h4("Upload your data file:"), multiple=FALSE, accept="text/plain"),
    helpText("Note: you only can upload the .txt file."),
    uiOutput("choose_columns1"),   #這裡是關鍵
    uiOutput("choose_columns2")    #這裡是關鍵
  ),
  
  mainPanel(
    verbatimTextOutput("summary"),
    plotOutput("plot",width = "500px", height = "500px")
  )  
  
))