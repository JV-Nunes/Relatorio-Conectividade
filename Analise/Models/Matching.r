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
match_year <- function(dataframe, year, states, formula, pre_split){
  # Selecionando apenas o ano da iteracao para fatorar a computação necessária
  df <- filter(dataframe, NU_ANO == year)
  # Selecionando observações de estados de interesse
  df <- filter(df, SG_UF_ESC %in% states)
  df <- transform(df, treated = as.numeric(treated))
  
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
  matched_df <- match.data(matching) %>% arrange(subclass, treated)
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
df <- read_parquet("../../Resultados/Agg/ENEM/aux/dados_para_matching-municipal.parquet")
df <- transform(df, NU_ANO = as.integer(NU_ANO))

states = c("MA", "PI", "RN", "AL", "SE", "PA", "CE", "AM", "TO")
# Definindo covariaveis para o matching
formula_match = treated ~  indice_gini + idhm_e + idhm_r + expectativa_anos_estudo + NT_MEDIA + taxa_analfabetismo_15_a_17
formula_reg = NT_MEDIA ~ treated

print(cat("Quantidade de linhas no dataframe inicial", nrow(df)))
for (ano in 2018:2018){
  print(sprintf("Executando para %s", ano))
  matched_obj <- match_year(df, ano, states, formula_match, FALSE)

  print("Matching executado. Salvando dataframe.")
  file <- "../../Resultados/Agg/ENEM/aux/postMatching/municipios-idh_NOTA.parquet"
  write_parquet( matched_obj$match, file )
  

  output <- do_regression(matched_obj$match, formula)
  print(matched_obj$summary)
  print(output$summary)

}



