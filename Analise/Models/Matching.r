library("dplyr")
library("MatchIt")
library("lmtest")
library("sandwich")
library("arrow")
options(scipen = 100, digits=4)

## Adicionando diretório ao path
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

df <- read_parquet("../../Resultados/Agg/ENEM/aux/dados_para_matching.parquet")

# Selecionando apenas o ano de 2020 para fatorar a computação necessária

df <- filter(df, NU_ANO == 2020)

# Selecionando observações de estados nordestinos

df <- filter(df, SG_UF_ESC %in% c("MA", "PI", "RN", "PB", "PE", "AL", "SE"))

# Executando o matching com Coarsened Exact Matching

matching <- matchit(Q025 ~ Q005 + Q025 + TP_FAIXA_ETARIA + TP_ESCOLA + Q006 + IND_CASA + MULHER + Q001 + Q022 + TP_ESTADO_CIVIL + NAO_BRANCO,
                    data = df,
                    method = 'cem', estimand = 'ATE'
                    )

summary(matching, un = FALSE)

matched_df <- match.data(matching) %>% arrange(subclass, treated)

# Performando análise de regressão
model <- lm(NU_NOTA_MT ~ Q025 + MULHER + IND_CASA + TP_FAIXA_ETARIA + NAO_BRANCO + Q006, data = matched_df, weights = weights)
coeftest(model, vcov. = vcovCL, cluster = ~subclass)

coefci(model, vcov. = vcovCL, cluster = ~subclass)

summary(model)
