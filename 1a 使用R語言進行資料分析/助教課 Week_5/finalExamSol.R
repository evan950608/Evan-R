#### 注意事項 ####
# 0. 請勿改動 angry_fruit.R，否則將導致此檔案中讀取資料出錯
# 1. 變數名稱請勿改動，若造成判斷錯誤一蓋不負責。
# 2. 請不要用 rm(list=ls()) 之類的東西，我們的 judge 會壞掉。
# 3. ggplot2 的 ggplot() 會回傳東西，第二大題的所有答案都請存到變數中
# ex: gg_exam <- ggplot(data=..., aes(...)) + ...
# 4. 提交答案之前請再次檢查變數存的東西是否符合題目要求。
# 5. 滿分不是一百分

#### 0 ####

# 0.0 (5%)
# 請自行查詢 require() 回傳值
# 請寫出程式碼 "若 沒安裝 rstudioapi 套件，則 安裝 rstudioapi。引入 rstudioapi "
if(!require('rstudioapi')){
    install.packages('rstudioapi')
    require('rstudioapi')
}

# 0.1 (5%)
# 已知 dirname(rstudioapi::getSourceEditorContext()$path) 會顯示當前.R檔案所在位置
# 請自行查詢 setwd() 和 dirname() 如何使用後，
# 寫出程式碼 "將當前 .R 檔案所在位置設為工作目錄"
# (如果寫不出來一樣請手動設定檔案當前目錄 final2 為 working directory)
setwd(dirname(rstudioapi::getSourceEditorContext()$path))


# 設定檔案當前目錄 final2 為 working directory 後才能 run 下面這行
# 請不要改動 angry_fruit.R 檔案
source('angry_fruit.R')

####  1  ####
## 俊俊是賣憤怒水果的商人
## 以下是今天他所進貨的憤怒水果的資料
# 水果名稱
fruit_name
# 憤怒程度
anger
# 美味程度
deliciousness


# 1.0 (5%)
# 把三筆資料做成一個 dataframe 存到變數 angry_fruit_na
# column names 分別是 Name, Anger, Deliciousness
angry_fruit_na <- data.frame(Name=fruit_name, Anger=anger, Deliciousness=deliciousness)
angry_fruit_na

# 1.1 (5%)
# 將 anger 或是 delicious 為 NA 值的資料從 angry_fruit_na 移除後
# 將結果存入 angry_fruit
# column names 分別是 Name, Anger, Deliciousness
angry_fruit <- na.omit(angry_fruit_na)
angry_fruit

# 1.2 (5%)
# 水果不能太憤怒，容易過熟影響美味程度
# 俊俊不販賣不美味的憤怒水果
# 理想的憤怒區間為 [0, 100]、而且美味門檻 >= 50
# 請將 angry_fruit 照理想的憤怒區間和美味門檻篩選後
# 將結果存入 ideal_fruit
ideal_fruit <- angry_fruit[angry_fruit$Anger <= 100 & angry_fruit$Anger > 0 & angry_fruit$Deliciousness >= 50,]

# 1.3 (5%)
# 俊俊希望販賣的水果有接近的憤怒值
# 請將憤怒程值超過一個標準差以外的資料從 ideal_fruit 移除
# 並將結果存入 very_ideal_fruit
v <- ideal_fruit$Anger
very_ideal_fruit <- ideal_fruit[(v >= (mean(v) - sd(v))) & (v <= (mean(v) + sd(v))),]
very_ideal_fruit
  
# 1.4 (5%)
# 冠冠想吃美味的水果
# 請將 very_ideal_fruit 美味值超過 80% 位數(pr80以上)的資料存入 good_fruit
good_fruit <- very_ideal_fruit[very_ideal_fruit$Deliciousness >= quantile(very_ideal_fruit$Deliciousness, 0.8),]
good_fruit

# 1.5 (5%)
# 冠冠有選擇障礙
# 請隨機從 good_fruit 選出一個水果 存入 cm_fruit (存 Name 就好)
# 請用 R 的函數去隨機，不能自己想一個數字
cm_fruit <- as.character(sample(good_fruit$Name, 1))
cm_fruit

# 1.6 (10%)
# 冠冠很滿足，但他不會寫程式
# 請幫他寫一個函式 which_to_eat
# 傳入參數 angry_fruit_na (ex: which_to_eat(angry_fruit_na)，輸入保證只有 angry_fruit_na)
# 回傳值為依照 1.1~1.5 步驟篩選後的水果名
# 並將輸出存進 cm_today_fruit

require('dplyr')

which_to_eat <- function(df){
    df <- na.omit(df)
    df <- df %>%
        filter(Anger <= 100, Deliciousness >= 50) %>%
        filter(abs(Anger - mean(.$Anger)) <= sd(.$Anger)) %>%
        filter(Deliciousness >= quantile(.$Deliciousness, 0.8)) %>%
        sample_n(1)
    return(as.character(df$Name))
}
cm_today_fruit <- which_to_eat(angry_fruit_na)
cm_today_fruit

# 1.7 (5%)
# 請將 angry_fruit 的 row 依照美味度由大到小排序後存入 angry_fruit_rank
# 若美味度相等，依照憤怒度由大到小排序
# 都一樣的話，依照索引值由小到大排序
angry_fruit_rank <- arrange(angry_fruit, desc(Deliciousness), desc(Anger))
angry_fruit_rank
  
# 1.8 (10%)
############################################################################
# 已載入 get_50d() (寫在 angry_fruit.R 裡面)                               #
# 呼叫 get_50d() 會得到一個 list，包含50筆結構如 angry_fruit_na 的         #
# dataframe                                                                #
# 注意資料是隨機生成，每次呼叫會不同                                       #
############################################################################
#
# 俊俊的水果資料每天都會更新
# 俊俊想觀察過去50天水果的資訊，以多進貨冠冠會想吃的水果
# 請寫一個函式 past_50_info()
# 沒有參數
# 過去50天俊俊進貨的水果資訊請用 get_50d() 來產生
#
# 回傳值是一個結構如 angry_fruit_na 的 dataframe
# 第一個 col 為 水果名稱，請使用 fruit_name
# 第二個 col 為「這 50 天中，該水果的平均憤怒程度」，50天皆為 NA 的水果請設為 NaN
# 第三個 col 為「這 50 天中，該水果的平均美味程度」，50天皆為 NA 的水果請設為 NaN
# 請先忽略 NA 後再取平均
# column names 分別為 Name, avg_Anger, avg_Deliciousness
past_50_info <- function(){
    
    past_50_days <- get_50d()
    
    avg_Anger <- sapply(past_50_days, function(df) df$Anger) %>%
        rowMeans(na.rm = T)
    
    avg_Deliciousness <- sapply(fifty, function(df) df$Deliciousness) %>%
        rowMeans(na.rm = T)
    
    avg_angry_fruit <- data.frame(Name = fruit_name,
                                  avg_Anger = avg_Anger,
                                  avg_Deliciousness = avg_Deliciousness)
    return (avg_angry_fruit)
}


####  2  ####

require('ggplot2')

# 2.1 (10%)
# 利用 ggplot2 畫出內建資料集 airquality 中 Month 為 8 的資料
# Ozone 與 Temp 的 x-y 關係點圖
# 並把圖存到變數 gg1 中
gg1 <- airquality %>%
    filter(Month == 8) %>%
    ggplot(aes(Ozone, Temp)) + geom_point()
gg1

# 2.2 (10%)
# 利用 ggplot2 畫出內建資料集 mtcars 中 wt, mpg
# 的 x-y 關係點圖，並依據不同的 cyl 分出不同顏色
# 並把圖存到變數 gg2 中
gg2 <- mtcars %>%
    ggplot(aes(wt, mpg, color=cyl)) +
    geom_point()
gg2

# 2.3 (10%)
# 畫出內建資料集 airquality 中
# x 軸為不同月份 Month，y 軸為該月份 Ozone 的平均值
# 的長條圖，並把圖存到變數 gg3 中
gg3 <- airquality %>%
    group_by(Month) %>%
    summarise(OzoneMean = mean(Ozone, na.rm=T)) %>%
    ggplot(aes(Month, OzoneMean)) +
    geom_bar(stat="identity")
gg3
  
# 2.4 (15%)
# (請依照 0.0 0.1 提示或手動將 .R 檔案當前位置設為 working directory)
# 讀取 "106_student.csv" 檔，存到變數 student 中
# 這份 csv 是 106 學年度全台各地大學專院校的學生人數 
# 請先把「等級別」為 "B 學士"、「日間.進修別」為 "D 日" 的資料篩選出來
# 再畫出臺北市大學與非臺北市大學的一年級人數總數的長條圖
# x 軸為是否位於臺北市，y 軸為一年級學生總數 (記得要把男女加起來)
# 並把圖存到變數 gg4 中
student <- read.csv('106_student.csv', sep=",", encoding='utf8')
student
view(student)

gg4 <- student %>%
    filter(等級別 == "B 學士", 日間.進修別 == "D 日") %>%
    # use gsub() to replace ',' as ''
    # ex: '1,024'
    transmute(freshman = as.numeric(gsub(",", "", 一年級男生)) + as.numeric(gsub(",", "", 一年級女生)),
              atTaipei = (縣市名稱 == "30 臺北市")) %>%
    ggplot(aes(atTaipei, freshman)) + 
    geom_bar(stat="identity")
gg4












