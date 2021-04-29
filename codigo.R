#IMPORTAÇÃO DOS DADOS

library(readr)
seguranca <- read_delim("data/seguranca.csv", 
                        ";", escape_double = FALSE, col_types = cols(MES = col_date(format = "%Y-%d-%m")), 
                         trim_ws = TRUE)

#MANIPULAÇÃO DOS DADOS

library(dplyr)

#Soma de roubos a ônibus

seguranca %>% summarise(total=sum(`Roubo a Ônibus (Urbano e em Rodovia)`))

#Cria uma estrutura de vetor
#seguranca %>% summarise(`Roubo a Ônibus (Urbano e em Rodovia)`)

#Soma de roubos a ônibus por região da cidade

roubo_areas <- seguranca %>% group_by(`Área Integrada de Segurança Pública - AISP`) %>% 
              summarise(total=sum(`Roubo a Ônibus (Urbano e em Rodovia)`))

#Adicionar uma variavel

seguranca2 <- seguranca %>% mutate(cvli = `Homicídio Doloso`+`Lesão Corporal Seguida de Morte`+
                       `Roubo com Resultado Morte - (Latrocínio)`+Estupro+
                       `Tentativa de Homicídio`)

