library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Summarize your data"), 
  
  sidebarPanel(
    #上傳檔案程式
    fileInput(inputId="files", label=h4("Upload your data file:"), multiple=FALSE, accept="text/plain"),
    #備註
    helpText("Note: you only can upload the .txt file."),
    sliderInput("n", h4("Select the observed rows:"), min=5, max=20, value=10),
    #新增 散步塗顏色的選取
    radioButtons("Color", "Select the color of histogram:", choices = c("Red" = "red", "Blue" = "blue", "Green" = "green"))
  ),
  
  mainPanel(
    verbatimTextOutput("summary"),  
    plotOutput("scatterPlot"),
    tableOutput("view")  
  )  
  
))
