library(shiny)

shinyServer(function(input, output) {
  
  DATA <- reactive({
    if (is.null(input$files)) {return()} else {
      dat <- read.table(input$files$datapath,header=T)
      return(dat) 
    }
  })
  
  #output$choose_columns1 & choose_columns : 可以讓使用者選擇變數
  output$choose_columns1 <- renderUI({  #這裡是關鍵
    dat = DATA()
    if (is.null(dat)) {return()} else {
      colnames <- colnames(dat)
      selectInput("Y", h4("Choose a dependence variable:"), choices = colnames)
    }
  })
  
  output$choose_columns2 <- renderUI({  #這裡是關鍵
    dat = DATA()
    if (is.null(dat)|is.null(input$Y)) {return()} else {
      colnames <- colnames(dat)
      selectInput("X", h4("Choose a independence variable:"), choices = colnames[which(colnames!=input$Y)])
    }
  })
  
  output$summary <- renderPrint({
    dat = DATA()
    if (is.null(dat)|is.null(input$Y)|is.null(input$X)) {return()} else {
      X <- dat[,input$X]  #這裡是關鍵，抓使用者所選的變數
      Y <- dat[,input$Y]  #這裡是關鍵
      #根據使用者所選的統計方式，進行計算
      Result=cor.test(X,Y,method=input$method) 
      return(Result)
    }  
  })
  
  output$plot <- renderPlot({
    dat = DATA()
    if (is.null(dat)|is.null(input$Y)|is.null(input$X)) {return()} else {
      X <- dat[,input$X]  #這裡是關鍵
      Y <- dat[,input$Y]  #這裡是關鍵
      plot(X,Y,pch=19,col=input$Color) #散佈圖，可選擇顏色
      abline(lm(Y~X),col="black")   
    }  
  })
  
})