library("dplyr")
library("MatchIt")
library("lmtest")
library("sandwich")
library("arrow")
options(scipen = 100, digits=4)

## Adicionando diretório ao path
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

df <- read_parquet("../../Resultados/Agg/ENEM/aux/dados_para_matching.parquet")

colnames(df)

matching <- matchit(treated ~ NU_ANO + TP_COR_RACA + Q005 + Q025 + TP_FAIXA_ETARIA + TP_ESCOLA + Q006 + IND_CASA + TP_SEXO + Q001 + Q022 + TP_ESTADO_CIVIL + NAO_BRANCO,
                    data = df,
                    method = 'cem', estimand = 'ATE'
                    )
is.na(df[NU_ANO])
