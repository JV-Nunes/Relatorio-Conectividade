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
match_year <- function(dataframe, year, states, all_states){
  # Selecionando apenas o ano da iteracao para fatorar a computação necessária
  df <- filter(dataframe, NU_ANO == year)
  # Selecionando observações de estados nordestinos
  df <- filter(df, SG_UF_ESC %in% states)
  # Filtrando da seguinte forma:
  # Grupo Tratado - observações de estados que receberam o programa de distribuição de chips 
  # e que tem Q025 = 1
  # Grupo Controle - Todas as outras observações com Q025 = 0. O matching terá como objetivo aproximar
  # os indivíduos de modo a observar apenas o efeito da distribuição do chip
  
  treated <- subset(df, treated == 1 & Q025 == 1)
  # Selecionando grupo de controle com diferentes estados ou apenas o estado de tratamento dependendo da flag.
  if (all_states == TRUE){
    control <- subset(df, treated == 0 & Q025 == 0)
  } else {
    control <- subset(df, Q025 == 0)
  }
  experiment <- rbind(treated, control) 
  # Executando o matching com Coarsened Exact Matching
  matching <- matchit(Q025 ~ Q005 + TP_FAIXA_ETARIA +  Q006 + IND_CASA + MULHER + Q001 + Q022 + TP_ESTADO_CIVIL + NAO_BRANCO,
                      data = experiment,
                      method = "cem", estimand = "ATE"
  )
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
df <- read_parquet("../../Resultados/Agg/ENEM/aux/dados_para_matching.parquet")

for (ano in 2018:2021){
  print(sprintf("Executando para %s", ano))
  states = c("CE")
  matched_obj <- match_year(df, ano, states, all_states = FALSE)

  print("Matching executado. Salvando dataframe.")
  file <- sprintf("../../Resultados/Agg/ENEM/aux/postMatching/data-%s.parquet", ano)
  write_parquet( matched_obj$match, file )
  
  formula <- NU_NOTA_MT ~ Q025 + MULHER + IND_CASA + TP_FAIXA_ETARIA + NAO_BRANCO + Q006
  output <- do_regression(matched_obj$match, formula)
  print(output$summary)

  #Criando arquivo com todos os sumários
  file <- sprintf("Summary/resultados-%s.txt", ano)
  sink(file = file)
  matched_obj$summary
  output$summary
  sink(file = NULL)
}

## Tests

c("MA", "PI", "RN", "PB", "PE", "AL", "SE", "PA", "CE")


