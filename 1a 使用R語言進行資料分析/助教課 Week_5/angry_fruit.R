################################# 警告 #################################
##    請勿改動這份檔案，否則將導致 finalExam2.R 中讀取資料出錯        ##
########################################################################

rm(list=ls())
fruit_name <- "Apple,
Apricot,
Avocado,
Banana,
Bilberry,
Blackberry,
Blackcurrant,
Blueberry,
Boysenberry,
Buddha's hand (fingered citron),
Crab apples,
Currant,
Cherry,
Cherimoya,
Chico fruit,
Cloudberry,
Coconut,
Cranberry,
Cucumber,
Custard apple,
Damson,
Date,
Dragonfruit,
Durian,
Elderberry,
Feijoa,
Fig,
Goji berry,
Gooseberry,
Grape,
Raisin,
Grapefruit,
Guava,
Honeyberry,
Huckleberry,
Jabuticaba,
Jackfruit,
Jambul,
Jujube,
Juniper berry,
Kiwano,
Kiwifruit,
Kumquat,
Lemon,
Lime,
Loquat,
Longan,
Lychee,
Mango,
Mangosteen,
Marionberry,
Melon,
Cantaloupe,
Honeydew,
Watermelon,
Miracle fruit,
Mulberry,
Nectarine,
Nance,
Olive,
Orange,
Blood orange,
Clementine,
Mandarine,
Tangerine,
Papaya,
Passionfruit,
Peach,
Pear,
Persimmon,
Plantain,
Plum,
Prune,
Pineapple,
Plumcot,
Pomegranate,
Pomelo,
Purple mangosteen,
Quince,
Raspberry,
Salmonberry,
Rambutan,
Redcurrant,
Salal berry,
Salak,
Satsuma,
Soursop,
Star fruit,
Strawberry,
Tamarillo,
Tamarind,
Ugli fruit,
Yuzu"

fruit_name <- strsplit(fruit_name, split=',\n')[[1]]
len = length(fruit_name)

anger = runif(len, min = 1, max = 200)
NAA = sample.int(len, 5)
anger[NAA] <- NA

deliciousness <- runif(len, min = 4, max = 100)
NAA = sample.int(len, 5)
deliciousness[NAA] <- NA

lockBinding("fruit_name",globalenv())
lockBinding("anger",globalenv())
lockBinding("deliciousness",globalenv())

update_info <- function(){
  ffruit_name <- fruit_name
  aanger <- runif(len, min = 1, max = 120)
  NAA = sample.int(len, 5)
  aanger[NAA] <- NA
  
  ddeliciousness <- runif(len, min = 1, max = 100)
  NAA = sample.int(len, 5)
  ddeliciousness[NAA] <- NA
  
  ddf <- data.frame(ffruit_name, aanger, ddeliciousness)
  
  colnames(ddf) <- c("Name", "Anger", "Deliciousness")
  return(ddf)
}
get_n_days <- function(n){
  v <- list(update_info())
  for(i in 2:n){
    v[[i]] <- update_info()
  }
  return(v)
}
get_50d <- function(){
  return(get_n_days(50))
}
get_50d()
length(get_50d())
