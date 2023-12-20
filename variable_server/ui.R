library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Linear regression for two continuous variables."), 
  
  sidebarPanel(
    fileInput(inputId="files", label=h4("Upload your data file:"), multiple=FALSE, accept="text/plain"),
    helpText("Note: you only can upload the .txt file."),
    uiOutput("choose_columns1"),   #這裡是關鍵，選擇不同變數
    uiOutput("choose_columns2"),    #這裡是關鍵
    # 計算的方式
    radioButtons("method", "What is the method to analysis?", choices = c("Pearson correlation" = "pearson", "Spearman correlation" = "spearman")),
    radioButtons("Color", "Select the color of histogram:", choices = c("Red" = "red", "Blue" = "blue", "Green" = "green"))
  ),

  mainPanel(
    verbatimTextOutput("summary"),
    plotOutput("plot",width = "500px", height = "500px")
  )  
  
))