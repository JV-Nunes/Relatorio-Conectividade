# Projeto Impactos da Conectividade em Métricas de Educação durante Pandemia de Covid-19

## Introdução

O projeto se propõe a analisar empiricamente a influência da conectividade e do acesso a dispositivos tecnológicos no desempenho dos participantes do Exame Nacional do Ensino Médio (ENEM). Utilizando uma rica base de microdados derivada das aplicações do ENEM, este estudo visa avaliar a relação entre características socioeconômicas, conectividade e o acesso a tecnologias com as notas obtidas pelos alunos.

## Metodologia

### Análise Empírica
A análise é conduzida a partir de duas perspectivas principais:

1. **Análise Correlacional:** Estima as variações entre as covariáveis socioeconômicas e os diferentes quantis da distribuição das notas, destacando a relação da conectividade e o acesso a dispositivos tecnológicos em diferentes níveis de desempenho.

2. **Inferência Causal:** Utiliza técnicas quasi-experimentais, como o Coarsened Exact Matching, para entender os efeitos da conectividade e dos dispositivos tecnológicos a partir de subgrupos de tratamento e controle.

A modelagem é fundamentada na função de produção da educação, considerando variáveis como características familiares, escolares, capacidade cognitiva e erro estatístico do modelo.

### Análise Correlacional

#### Correlações e Mudanças na Amostra
- Mudanças na amostra do ENEM ao longo dos anos impactaram as correlações observadas.
- A presença de internet e dispositivos tecnológicos aumentou, especialmente durante a pandemia.
- Correlações indicam maior influência da conectividade em alunos com desempenho inferior.

#### Distribuição das Notas
- Variações nos coeficientes das regressões indicam aumento na importância da conectividade, especialmente durante a pandemia.
- Acesso à internet, computador e celular mostra correlação positiva com as notas.

### Efeito Médio da Conectividade

#### Matching e Efeitos Agregados
- Utilização do Coarsened Exact Matching para equilibrar grupos de tratamento e controle.
- Estimativas indicam aumento médio nas notas para quem possui internet, computador e celular em casa.
- A combinação dessas tecnologias tem um efeito agregado significativo, especialmente durante a pandemia.

#### Implicações Sociais
- O aumento nas notas sugere uma vantagem significativa na seleção para o ensino superior no Brasil.
- A falta de acesso a tecnologias pode criar um gap de aprendizagem, afetando especialmente famílias de baixa renda.

## Métodos de Estimação

### Regressão Quantílica
- Utilização do método de regressão quantílica para analisar a relação percentual entre variáveis explicativas e as notas dos alunos em diferentes quantis.
- Consideração de variáveis como faixa etária, nível de educação dos pais, renda familiar, raça, gênero, entre outras.

### Coarsened Exact Matching (CEM)
- Aplicação do Coarsened Exact Matching para balancear grupos de tratamento e controle.
- Estimação dos efeitos médios da posse de internet, computador e celular nas notas, destacando o aumento significativo durante a pandemia.

Este projeto busca não apenas compreender a influência da conectividade no desempenho educacional, mas também destacar implicações sociais e educacionais relevantes, especialmente em um contexto de mudanças na educação durante a pandemia. Para detalhes metodológicos adicionais, consulte o apêndice.
