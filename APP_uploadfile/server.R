library(shiny)

shinyServer(function(input, output) {
  
  DATA = reactive({
    if (is.null(input$files)) {return()} else {
      dat = read.table(input$files$datapath,header=T)
      return(dat) 
    }
  })
  
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
  
  #判斷是否有上傳檔案。有的話則
  output$scatterPlot = renderPlot({
    dat = DATA()
    if (is.null(dat)) {return()} else {
      plot(dat,col=input$Color)
    }
  })
  
  #將圖片儲存進 PDF 檔，當下載完檔案之後，關閉 pdf 檔案
  output$download = downloadHandler(
    filename = function() {'plot.pdf'},
    content = function(con) {
      dat = DATA()
      if (is.null(dat)) {return()} else {
        pdf(con)
        plot(dat,col=input$Color)
        dev.off()
      }
    }
  )
})