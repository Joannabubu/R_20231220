#撰寫一個 APP，當使用者賞船檔案時，就能看到他所上傳的資料之變動

Data=read.table("Example.txt", header = TRUE)
#讀取Example.txt，並存成"Data"這個物件(資料表格式)
head(Data, 10) 
#看"Data"這個資料表的前10個row
summary(Data)
#看"Data"這個資料表的所有變項的基本資訊

Color = "red"
plot(Data, col = Color)
