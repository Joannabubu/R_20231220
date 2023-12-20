library(shiny)

shinyServer(function(input, output) {
  
  output$summary = renderPrint({
    if (is.null(input$files)==TRUE) {return("You have to up load your data!!!")} else {
      dat = read.table(input$files$datapath, header = TRUE)
      summary(dat)                     
    }        
  })
  
  output$view = renderTable({
    if (is.null(input$files)==TRUE) {return()} else {
      dat = read.table(input$files$datapath, header = TRUE)
      # 變數抓取 sidebar 的值為多少，以控制summary 要跑出多少欄的資料
      head(dat, input$n)                     
    }        
  })
  
})