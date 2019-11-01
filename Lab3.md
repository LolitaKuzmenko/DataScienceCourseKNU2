Лабораторна робота № 3. Зчитування даних з WEB.
В цій лабораторній роботі необхідно зчитати WEB сторінку з сайту IMDB.com зі
100 фільмами 2017 року виходу за посиланням
«http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_ty
pe=feature». Необхідно створити data.frame «movies» з наступними даними:
  номер фільму (rank_data), назва фільму (title_data), тривалість (runtime_data).
Для виконання лабораторної рекомендується використати бібліотеку «rvest».
CSS селектори для зчитування необхідних даних: rank_data: «.text-primary»,
title_data: «.lister-item-header a», runtime_data: «.text-muted .runtime». Для
зчитування url використовується функція read_html, для зчитування даних по CSS
селектору – html_nodes і для перетворення зчитаних html даних в текст -
  html_text. Рекомендується перетворити rank_data та runtime_data з тексту в
числові значення. При формуванні дата фрейму функцією data.frame
рекомендується використати параметр «stringsAsFactors = FALSE».
В результаті виконання лабораторної роботи необхідно відповісти на запитання:
  1. Виведіть перші 6 назв фільмів дата фрейму.
2. Виведіть всі назви фільмів с тривалістю більше 120 хв.
3. Скільки фільмів мають тривалість менше 100 хв.

```R
library(rvest)

movies_url<-"http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature"

reading_movies_url<-read_html(movies_url)

rank<-html_nodes(reading_movies_url, ".text-primary")
title<-html_nodes(reading_movies_url, ".lister-item-header a")
runtime<-html_nodes(reading_movies_url, ".text-muted .runtime")

rank_text<-html_text(rank, trim = TRUE)
title_text<-html_text(title, trim = TRUE)
runtime_text<-html_text(runtime, trim = TRUE)

rank_data<-as.integer(rank_text)
library(stringr)
runtime_data<-str_remove(runtime_text, " min")
runtime_data<-as.integer(runtime_data)
title_data<-title_text

Sys.setlocale(locale = "Ukrainian")
movies<-data.frame(rank_data, title_data, runtime_data, stringsAsFactors = FALSE)
> head(movies)
  rank_data                              title_data runtime_data
1         1                         The Current War          102
2         2                                    Воно          135
3         3 Зорянi вiйни: Епiзод 8 - Останнi Джедаi          152
4         4                                  Пастка          104
5         5            Той, хто бiжить по лезу 2049          164
6         6                              Диво-Жiнка          141



question_one<-head(movies$title_data, 6)
> question_one
[1] "The Current War"                        
[2] "Воно"                                   
[3] "Зорянi вiйни: Епiзод 8 - Останнi Джедаi"
[4] "Пастка"                                 
[5] "Той, хто бiжить по лезу 2049"           
[6] "Диво-Жiнка" 

question_two<-subset(movies$title_data, runtime_data>120)
> question_two
 [1] "Воно"                                    
 [2] "Зорянi вiйни: Епiзод 8 - Останнi Джедаi" 
 [3] "Той, хто бiжить по лезу 2049"            
 [4] "Диво-Жiнка"                              
 [5] "Call Me by Your Name"                    
 [6] "Тор: Рагнарок"                           
 [7] "Людина-павук: Повернення додому"         
 [8] "Мати!"                                   
 [9] "Джон Уiк 2"                              
[10] "Форма води"                              
[11] "Пiрати Карибського моря: Помста Салазара"
[12] "Король Артур: Легенда меча"              
[13] "Логан: Росомаха"                         
[14] "Темнi часи"                              
[15] "Чужий: Заповiт"                          
[16] "Гра Моллi"                               
[17] "Красуня i Чудовисько"                    
[18] "Вартовi Галактики 2"                     
[19] "Kingsman: Золоте кiльце"                 
[20] "Валерiан i мiсто тисячi планет"          
[21] "Форсаж 8"                                
[22] "Вбивство священного оленя"               
[23] "Вороги"                                  
[24] "Трансформери: Останнiй лицар"            
[25] "Примарна нитка"                          
[26] "Saban's Могутнi рейнджери"               
[27] "1+1: Нова iсторiя"                       
[28] "Only the Brave"                          
[29] "Метелик"                                 
[30] "Зменшення"                               
[31] "Brawl in Cell Block 99"                  
[32] "Усi грошi свiту"                         
[33] "Вiйна за планету мавп"                   
[34] "War Machine"                             
[35] "Сiм сестер"                              
[36] "The Glass Castle"                        
[37] "Пострiл в безодню"

question_three<-length(subset(movies$title_data, runtime_data>100))
> question_three
[1] 81
```