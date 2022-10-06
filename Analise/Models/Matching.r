library("dplyr")
library("MatchIt")
library("lmtest")
library("sandwich")
library("arrow")
library(data.table)
options(scipen = 100, digits=4)

## Adicionando diretório ao path
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Funcoes
match_year <- function(dataframe, year, states, formula, pre_split, filter){
  # Selecionando apenas o ano da iteracao para fatorar a computação necessária
  df <- filter(dataframe, NU_ANO == year)
  
  if (filter == TRUE){
    # Selecionando observações de estados de interesse
    df <- filter(df, SG_UF_ESC %in% states)
    df <- transform(df, treated = as.numeric(treated))
  }
  # Separando previamente em grupo de controle e tratamento (para estrato à nível individual)
  if (pre_split == TRUE){
    treated <- subset(df, treated == 1 & Q025 == 1)
    control <- subset(df, treated == 0 & Q025 == 0)
    experiment <- rbind(treated, control) 
  } else {
    experiment <- df
  }
  # Executando o matching com Coarsened Exact Matching
  matching <- matchit( formula, data = experiment, method = "cem", estimand = "ATE" )
  
  summ <- summary(matching, un = FALSE)
  matched_df <- match.data(matching) %>% arrange(subclass, Q025)
  # Retornando dataframe com match
  retorna <- list("match" = matched_df, "summary" = summ )
  return (retorna)
}
do_regression <- function(dataframe, formula){
  # Performando análise de regressão
  model <- lm(formula, data = dataframe, weights = weights)
  #coeft <- coeftest(model, vcov. = vcovCL, cluster = ~subclass)
  #coefc <- coefci(model, vcov. = vcovCL, cluster = ~subclass)
  summ <- summary(model)
  retorna <- list("summary" = summ)
  return(retorna)
}

# Script
#df <- read_parquet("../../Resultados/Agg/ENEM/aux/dados_para_matching-municipal.parquet")
df <- read_parquet("../../Resultados/Agg/ENEM/aux/dados_para_matching_individual-20-21.parquet")
df = df  %>%  
      transform(Q025 = as.numeric(Q025)) %>% 
      transform( NU_ANO = as.integer(NU_ANO)) %>% 
      #filter(ESCOLA_PUBLICA == 1 )
      mutate(COMPUTADOR = if_else(Q024 == 0, 0, 1))
             
states = c("MA", "PI", "RN", "AL", "SE", "PA", "CE", "AM", "TO")
# Definindo covariaveis para o matching
#formula_match = treated ~  indice_gini + idhm_e + idhm_r + expectativa_anos_estudo + NT_MEDIA + taxa_analfabetismo_15_a_17
formula_match = COMPUTADOR ~ TP_FAIXA_ETARIA + Q001 + Q002 + Q005 + Q006 + IND_CASA + NAO_BRANCO + MULHER + SOLTEIRO 
#formula_reg = NT_MEDIA ~ treated
formula_reg = LOG_NT_MEDIA ~ COMPUTADOR

print(cat("Quantidade de linhas no dataframe inicial", nrow(df)))
for (ano in 2020:2021){
  print(sprintf("Executando para %s", ano))
  matched_obj <- match_year(df, ano, states, formula_match, FALSE, FALSE)

  print("Matching executado. Salvando dataframe.")
  file <- sprintf("../../Resultados/Agg/ENEM/aux/postMatching/individuo-Q024-%s.parquet", ano)
  write_parquet( matched_obj$match, file )
  

  #output <- do_regression( matched_obj$match, formula_reg )
  #print(matched_obj$summary)
  #print(output$summary)

}



