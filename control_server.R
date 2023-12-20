Data = read.table("Example.txt", header = TRUE)
head(Data, 10)

summary(Data)

Result = lm(Weight~Height, data = Data) #linear regression test
Result
summary(Result)

plot(Data$Height, Data$Weight, pch = 19)
abline(Result)

colnames(Data)
colnames(Data)[1]
colnames(Data)[4]

Result1 = lm(Data[,"Weight"]~Data[,"Height"])
Result1
summary(Result1)
#導入 renderUI 及 uiOutput 兩個函數，它們能讓我們先讀取檔案，再讓控制區出現檔案內的變數
#renderUI : 動態UI 輸入
# uiOutput : 動態 UI 輸出


# Pearson correlation
Result2 = cor.test(Data[,"Weight"], Data[,"Height"], method = "pearson") 
Result2

# Spearman correlation
Result3 = cor.test(Data[,"Weight"], Data[,"Height"], method = "spearman") 
Result3