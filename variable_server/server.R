library(shiny)

shinyServer(function(input, output) {
  
  DATA <- reactive({
    if (is.null(input$files)) {return()} else {
      dat <- read.table(input$files$datapath,header=T)
      return(dat) 
    }
  })
  
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
      X <- dat[,input$X]  #這裡是關鍵
      Y <- dat[,input$Y]  #這裡是關鍵
      Result=lm(Y~X)
      return(summary(Result))
    }  
  })
  
  output$plot <- renderPlot({
    dat = DATA()
    if (is.null(dat)|is.null(input$Y)|is.null(input$X)) {return()} else {
      X <- dat[,input$X]  #這裡是關鍵
      Y <- dat[,input$Y]  #這裡是關鍵
      plot(X,Y,pch=19) #散佈圖
      abline(lm(Y~X),col="black")   
    }  
  })
  
})