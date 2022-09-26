library("dplyr")
library("MatchIt")
library("lmtest")
library("sandwich")
library("arrow")
options(scipen = 100, digits=4)

## Adicionando diretório ao path
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

df <- read_parquet("../../Resultados/Agg/ENEM/aux/dados_para_matching.parquet")

df <- filter(df, SG_UF_ESC %in% c("MA", "PI", "RN", "PB", "PE", "AL", "SE", "PA"))

# Percentual de acesso a internet do grupo 'tratado' é menor que o grupo de controle. Evidentemente isso provoca
# um erro ao executar a regressão para Nota ~ treated

df %>% group_by(NU_ANO, treated) %>% summarise(mean(Q025))
# Filtrando pelos estados que receberam tratamento

df %>% filter( treated == 1 ) %>% group_by(NU_ANO, SG_UF_ESC) %>%  summarise(mean(Q025))

df %>% filter( treated == 0 ) %>% group_by(NU_ANO, SG_UF_ESC) %>%  summarise(mean(Q025))
