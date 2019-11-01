Лабораторна робота № 1. Завантаження та зчитування даних.
1. За допомогою download.file() завантажте любий excel файл з порталу
http://data.gov.ua та зчитайте його (xls, xlsx – бінарні формати, тому
встановить mode = “wb”. Виведіть перші 6 строк отриманого фрейму
даних.

```R

url_uran<-"https://data.gov.ua/dataset/64579ef8-633c-4752-8f21-75231b3bdbc5/resource/2d4b578f-866e-4133-9fe2-213eb2aaa261/download/nuclear_production_07_2019.xlsx"
dest_uran<-"C:/Users/Lola/Downloads/Uran.xlsx"
download.file (url_uran, dest_uran, mode = "wb")
library(readxl)
uran<-read_xlsx(dest_uran)
head(uran)

# A tibble: 6 x 8
year month     code enterprise       activity    product  amount    cost
<dbl> <dbl>    <dbl> <chr>            <chr>       <chr>     <dbl>   <dbl>
1  2018     1 14309787 "ДП \"СхідГЗК\"" видобуток   УР      60095       NA 
2  2018     1 14309787 "ДП \"СхідГЗК\"" виробництво УОК       139.  429966.
3  2018     2 14309787 "ДП \"СхідГЗК\"" видобуток   УР      57140       NA 
4  2018     2 14309787 "ДП \"СхідГЗК\"" виробництво УОК       162.  504702.
5  2018     3 14309787 "ДП \"СхідГЗК\"" видобуток   УР      61277       NA 
6  2018     3 14309787 "ДП \"СхідГЗК\"" виробництво УОК        93.2 285268.

```

2. За допомогою download.file() завантажте файл getdata_data_ss06hid.csv за
посиланням
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv та
завантажте дані в R. Code book, що пояснює значення змінних
знаходиться за посиланням
https://www.dropbox.com/s/dijv0rlwo4mryv5/PUMSDataDict06.pdf?dl=0
Необхідно знайти, скільки property мають value $1000000+

```R

url_data<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
dest_data<-"C:/Users/Lola/Downloads/Data.csv"
download.file (url_data, dest_data)
data<-read.csv(dest_data)
VAL24<-which(data$VAL==24)
length(VAL24)

[1] 53

```
  
3. Зчитайте xml файл за посиланням
http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
Скільки ресторанів мають zipcode 21231?

```R

library(XML)
url_restaurants<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc_restaurants<-xmlTreeParse(url_restaurants, useInternal = TRUE)
rootNode_restaurants<-xmlRoot(doc_restaurants)
zipcode<-xpathSApply(rootNode_restaurants, "//zipcode", xmlValue)
which(zipcode==21231)
zipcode21231<-which(zipcode==21231)
length(zipcode21231)

[1] 127

```