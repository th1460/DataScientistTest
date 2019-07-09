require(plumber)
require(dplyr)
require(magrittr)
require(DBI)
require(dbplyr)
require(lubridate)
require(lme4)

#* @apiTitle Prediction 28 February

#* Return the prediction from 28 February
#* @param cliente Cliente Code
#* @get /predict
function(cliente) {
  
  # criando canal com DB
  
  canal <- dbConnect(RSQLite::SQLite(), dbname = "DB.sqlite")
  
  # separação dos dados de treino e de teste
  
  data_train1 <- # dados de treino do mês de janeiro
    tbl(canal, "dataset_a") %>% 
    filter(customerCode == cliente) %>% 
    as_tibble() %>% 
    filter(month == 1)
  
  data2 <- # dados do mês de fevereiro
    tbl(canal, "dataset_a") %>% 
    filter(customerCode == cliente) %>% 
    as_tibble() %>% 
    filter(month == 2)
  
  data_train2 <- # seleção dos 80% do mês de fevereiro para treino
    data2 %>% 
    slice(1:round(data2 %>% count() %>% pull() * .8, 0))
  
  # ajuste do modelo
  
  fit <- 
    data_train1 %>% 
    bind_rows(data_train2) %>%
    group_by(month) %>% 
    mutate(cumN = cumsum(n),
           cumTotal = cumsum(total)) %>%
    
    # modelo multinível
    glmer(cumN ~ poly(day, 2) + (day|month) , 
          offset = log(cumTotal), # offset
          family = poisson(link = "log"), # família poisson com o link = log
          data = .)
  
  
  # função para cálculo do valor predito
  
  pred <- function(x){ 
    
    (predict(fit, 
             newdata = data.frame(day = x, month = 2), 
             type = "response") * 100) %>% round(1)
    
  }
  
  pred(28)
  
}
