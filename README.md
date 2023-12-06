# Relatorio-Conectividade

## Introdução

## Metodologia
Metodologia
Nas próximas seções, realizaremos uma análise empírica, utilizando a rica base de microdados derivada da aplicação do Exame Nacional do Ensino Médio (ENEM). A nota obtida por cada aluno é utilizada como uma proxy que permite a avaliação de desempenho escolar dos aplicantes, bem como a qualificação dos principais fatores que influenciam no acesso ao ensino superior no Brasil. Esses dados contém informações detalhadas do background socioeconômico de cada indivíduo que realiza o teste, possibilitando a estimação da influência de cada variável avaliada como explicativa na composição de sua nota final. 
A análise foi conduzida a partir de duas principais perspectivas:
Análise correlacional, estimando as variações entre as covariáveis socioeconômicas disponíveis e os diferentes quantis da distribuição das notas, com o intuito de quantificar a relação da conectividade e o acesso à dispositivos tecnológicos em diferentes níveis de desempenho;
Inferência causal, utilizando uma técnica quasi-experimental para entender os efeitos da conectividade e dos dispositivos tecnológicos a partir de subgrupos de tratamento e controle;
Para avaliarmos as variáveis explicativas que compõem a nota obtida, utilizamos como referência a seguinte função de produção da educação, desenvolvida por Wolpin (2003, apud Badasyan, 2018):
Tija=Ta[Fij(a), Sij(a), ij0,ija]
Sendo, Tija a nota obtida pelo indivíduo i na residência j na idade a; Fij(a) um vetor de características familiares do indivíduo na idade a; Sij(a) as características escolares e dos professores do indivíduo na idade a; ij0 sua capacidade cognitiva (que não é observável) e ija o erro estatístico do modelo.
No período de pandemia, as características escolares perderam níveis de significância frente ao cenário do fechamento emergencial das escolas, que chegou a cerca de 1 ano e 7 meses em alguns estados do Brasil. Com isso, características familiares como educação dos pais, renda familiar, quantidade de pessoas vivendo na residência, presença de equipamentos tecnológicos e internet, podem ter ganhado maior destaque.
São essas últimas que foram quantificadas a partir dos dados disponibilizados pelo Inep, e o modelo utiliza essas entradas individuais como forma de identificar padrões em cada corte anual dos aplicantes do ENEM. 
Para estimar os resultados, utilizamos técnicas econométricas extensamente aplicadas nos estudos estatísticos e de inferência causal: regressão quantílica, na avaliação dos impactos de cada covariável nos diferentes quantis das notas; Coarsened Exact Matching (King, 2022), para criar grupos de tratamento e controle diversos e estimar o efeito médio de cada tratamento nas notas. Maiores detalhes metodológicos estão disponíveis no apêndice.

### Análise Correlacional
Correlação e Peso
Inicialmente, é importante ressaltar que o perfil amostral dos alunos respondentes do ENEM variou significativamente ao longo dos últimos anos. 
O Exame Nacional do Ensino Médio teve forte queda em números de inscrições para o período final correspondente à pandemia de Covid-19. Em 2019 foram realizadas 5,095 milhões de inscrições, passando a 5,783 milhões em 2020 e sofrendo uma severa redução para 3,39 milhões de inscritos confirmados em 2021.
Ao analisar a estratificação amostral de inscritos brasileiros, concluintes do ensino médio em ensino regular e não-treineiros, é possível notar mudanças significativas no perfil socioeconômico dos indivíduos:

Elaboração própria, 2022

No quesito racial, a proporção amostral de pessoas autodeclaradas brancas aumentou de  38,2% para 45,6% entre 2019 e 2021, um aumento total de 7,4 p.p. De forma inversa, a proporção de pessoas autodeclaradas pardas caiu de 45,7% para 40,9% no mesmo período, redução total de 4,8 p.p. A proporção de pessoas pretas, amarelas e indígenas sofreu redução de 2,2;  0,3 e 0,14 pontos percentuais, respectivamente.
Sobre a renda familiar média, houve redução na proporção dos inscritos pertencentes aos grupos C e B (-10,6 p.p. e -1,5 p.p. respectivamente), enquanto cresceu a parcela do grupo D no período – representando um aumento na proporção de grupamentos de maior renda familiar média dentre a amostra.
Na análise de dependência escolar, a proporção amostral dos estudantes de escola pública diminuiu intensamente: de 87,6% para 77,1% entre o período,  acumulando redução de 10,5 pontos percentuais. Este fator pode explicar parte das mudanças relatadas na estratificação racial e de renda da seleção de inscritos.
É possível notar considerável aumento na presença de internet e dispositivos de acesso nas residências da amostra de inscritos durante o triênio. A proporção de indivíduos que declararam ter acesso à internet em suas residências subiu de 77% para 90,3% no período (+13,45 p.p.).  A parcela de indivíduos que possui ao menos um computador aumentou em 9,35 p.p., enquanto a cobertura de telefones celulares subiu de 97% para 98%.
Parte desse aumento na conectividade pode ser explicado pela adoção em larga escala das aulas no formato à distância durante o período, porém a mudança nas características socioeconômicas da amostra dificultam a determinação do efeito.
Correlações

Essas mudanças na composição amostral influenciam nas correlações observadas entre as notas recebidas e diferentes variáveis explicativas durante a recente série histórica. Ao executarmos regressões lineares múltiplas, utilizando as notas individuais para cada edição a partir de 2018, verificamos a seguinte evolução nos coeficientes de cada uma das variáveis tidas como explicativas:
O coeficiente para ter acesso à internet praticamente dobrou durante o período, indicando que a variação positiva de ter internet residencial na nota ficou maior para os anos de pandemia. Coeficientes de ter computador e ter celular também cresceram em peso.
Ser de escola pública, que tem correlação negativa com a nota, teve redução no coeficiente durante a evolução. Essa redução entretanto está associada a alteração da distribuição amostral e não é robusta;
As demais variáveis explicativas se mantiveram aproximadamente constantes em relação à seus coeficientes.
Gráfico representando os coeficientes de regressões múltiplas executadas sobre as notas dos participantes de cada edição do Enem (2018 a 2021). Variáveis estão ordenadas na legenda e barras seguem a ordem.
Essas mudanças indicam que houve uma tendência de crescimento da importância média das tecnologias e acesso à internet. No entanto, são fortemente influenciadas pela alteração na composição da amostra do Exame.
Distribuição das notas

É esperado que cada uma das variáveis tidas como explicativas influencie de forma distinta e em diferentes proporções as notas mais baixas e mais altas obtidas pelos alunos. No Brasil, as fortes desigualdades de oportunidades também produzem reflexo no desempenho educacional, o que pode induzir uma diferença significativa na importância atribuída a diferentes fatores para níveis distintos de aprendizagem. Diferenças de gênero no desempenho escolar, por exemplo, podem decorrer por históricos familiares, expectativas sociais nos papéis de gênero ou mesmo por complicações como gravidez precoce. Tendo em vista esse cenário, as correlações podem ser mais fortes ou mais fracas dependendo a que nível de desempenho seja analisado.
A outra pergunta a que queremos responder neste caso é “para quais níveis de desempenho a conectividade e dispositivos tecnológicos influenciam mais vigorosamente?". 
Ao realizar a estimação dos coeficientes de regressão em diferentes quantis das notas, para os cortes de 2020 e 2021 observamos que os pesos não são homogêneos:
Estudantes que possuem acesso à internet tendem a ter maiores notas, sendo essa relação ainda mais positiva para estudantes presentes nos níveis inferiores da nota média do Enem. Ou seja, para notas inferiores, o acesso à internet é associado à uma melhor performance do estudante (+7% de aumento);
Estudantes que possuem computador em suas residências também tendem a ter notas maiores, sendo a maior correlação observada nas notas próximas à mediana da distribuição;
Estudantes que possuem celular também apresentam vantagens nas notas, mas a correlação é menos forte e mais homogênea entre diferentes níveis de notas;
Estudantes de escola pública tendem a ter notas inferiores na média, sendo o efeito negativo mais observável nas piores notas. Para notas superiores da distribuição, o efeito negativo de ser de escola pública reduz, saindo de -6,5% nos quantis inferiores à -4% nos superiores;
Mulheres tendem a ter um desempenho médio ligeiramente inferior em relação aos homens. Porém a curva é bastante heterogênea: nas notas mais baixas, mulheres tendem a desempenhar melhor que homens, com pesos que chegam a +3%. Entretanto, nos quantis superiores das notas os homens tendem a ter maior desempenho.
Ser branco também se relaciona positivamente com a nota observada. Alunos não-brancos (pardos, pretos e indígenas) têm desempenho médio inferior, sendo esse efeito menos observado para as notas mais altas, onde há certo nivelamento;
Renda familiar tem relação positiva com a nota, principalmente nos quantis próximos à mediana;
Educação dos pais tem relação positiva, mas o ajuste não encontrou uma relação forte para com as notas;
Estar solteiro também afeta positivamente e de forma crescente. Ou seja, as diferenças são maiores entre estar ou não solteiro nas notas superiores da distribuição;
Essas correlações apesar de concordarem com as estimativas obtidas na média nos contam uma história um tanto distinta. Ter acesso à internet, por exemplo, pode impactar mais profundamente para alunos que não possuem um desempenho elevado, sendo essa uma ferramenta que amplia as oportunidades de aprendizagem nesse nível. Estudantes que obtêm notas altas tendem a ter menos influências de fatores socioeconômicos, provavelmente por questões cognitivas que não são observadas e não estão especificadas no nosso modelo. O ponto crucial que as estimações mostram é que, acesso a dispositivos tecnológicos e conectividade em suas residências estão relacionados a um crescimento maior nas notas de alunos com desempenhos inferiores e medianos.
Apresentamos também no apêndice os gráficos dos coeficientes de regressão quantílica, distribuídos ao longo dos quantis de distribuição das notas médias para as edições de 2020 e 2021. A linha tracejada em vermelho representa os coeficientes da regressão linear, ou seja, o efeito percentual médio de cada variável enxergado nas notas médias do Enem.
Efeito médio da conectividade

Quando desejamos analisar a relação entre dois eventos, sobre uma perspectiva de causa e efeito, temos um problema de inferência causal. A causalidade identifica uma relação direta entre um evento A e outro B, em que A é necessário à ocorrência de B. 
Para identificar causalidade entre eventos, se realizam experimentos. Estes, normalmente possuem duas amostras: controle e tratamento, com distribuições similares e que foram escolhidas aleatoriamente. A partir desse processo, consegue-se eliminar eventuais vieses de seleção e pode-se comparar as diferenças no resultado como estritamente advindas de um tratamento sobre avaliação.
Entretanto, nem sempre é possível realizar experimentos. Com estudos sociais, dificilmente se planeja um cenário em que podemos realizar um tratamento de forma discriminada entre grupos de pessoas. A partir disso se elaboraram as técnicas quasi-experimentais, que procuram simular experimentos a partir de dados observacionais. A ideia principal é que, ao simular ao máximo um experimento, conseguiríamos eliminar o viés da análise, estando aptos para extrair dos eventos ocorridos, efeitos causais. É uma tarefa complexa, pois o viés pode estar em vários pontos, e é muitas vezes impraticável remover todos os ruídos para que a comparação seja válida sob um ponto de vista científico.
Nesta seção, iremos explorar uma técnica quasi-experimental bastante utilizada nos estudos de inferência causal: Matching. A ideia fundamental dessa técnica é que, para obtermos os efeitos derivados de um tratamento, devemos comparar os retornos potenciais de um mesmo indivíduo para o caso com tratamento e o caso sem tratamento. Como não podemos auferir retornos potenciais e apenas os retornos concretizados, a premissa é que iremos investigar esses efeitos a partir de “gêmeos estatísticos”, ou seja, grupos de indivíduos que tenham covariáveis semelhantes, sendo um grupo o que recebe o tratamento e o outro grupo o que não recebe.

Conectividade
Até então, realizamos análises correlacionais, identificando que existe uma relação positiva entre a presença de dispositivos tecnológicos e internet, nas notas médias de cada indivíduo. Para aprofundar nossa análise e garantir maior significância, utilizamos do Matching para encontrar grupos balanceados de controle e tratamento e compararmos os resultados das presenças de cada um dos nossos interesses.
Subdividimos entre dois grupos de indivíduos semelhantes as seguintes seleções:
Com Internet x Sem Internet
Com Computador x Sem Computador
Com Celular x Sem Celular
Para isto, utilizamos o método denominado Coarsened Exact Matching (Iacus, Stefano & King, 2012), que está detalhado no apêndice. Com ele, garantimos que os dois grupos estão balanceados por todas as variáveis já controladas anteriormente, criando os pares de indivíduos que receberam ou não acesso à internet ou a cada tipo de tecnologia.  A hipótese de identificação é que, controlado o balanço entre os dois grupos, o efeito observado na nota média difere por conta do tratamento utilizado.
As diferenças entre as amostras foram computadas por meio de regressão linear ponderada, indicando o efeito médio de cada um dos tratamentos. Os resultados desta análise são intrigantes:

Efeito de Possuir
Edição Enem
2018
2019
2020
2021
Internet
1,84%
1,76%
2,43%
2,9%
Computador
3,75%
4,12%
4,66%
4,8%
Celular
3,72%
3,64%
4,05%
3,93%
Efeito Total Agregado
9,31%
9,52%
11,14%
11,63%

Erros padrão robustos à correlação de cluster e todos menores ou iguais a 0.002
Estimamos que possuir internet em casa produziu um aumento médio nas notas obtidas próximo a 3% para o ano de 2021. Possuir computador em casa produz um acréscimo de 4,8% e possuir celular de 3,93%.
Isoladamente, o impacto que estas tecnologias têm nas notas é significativo. Entretanto, o efeito é potencializado quando consideramos a combinação dos equipamentos: em 2021, um aluno que possuía acesso à internet, computador e celular em sua residência acumulou um aumento médio próximo a 12% em sua nota. 
É evidente, também, que houve um crescimento nos coeficientes estimados para os anos de pandemia. Há um grande salto de importância no acesso a essas tecnologias entre os anos de 2019 e 2020, em que o efeito agregado cresceu 1.62 pontos percentuais (aumento de 17%). É visto que há uma tendência de crescimento prévio no peso do acesso, mas o período de pandemia fez com que essas ferramentas tenham ganhado ainda maior importância, e de forma repentina.
Efeito médio do tratamento em possuir cada uma das tecnologias para a nota média do Enem em cada edição. Efeitos calculados por meio de Matching.
A magnitude do aumento na nota promovido para os últimos anos (+12% em 2021) induz que pode haver um gap de aprendizagem entre os indivíduos que não possuíam acesso a essas tecnologias no momento da pandemia. Famílias pobres que não podem arcar com os custos de aquisição dessas tecnologias podem ter seus filhos ainda mais prejudicados em termos de aprendizagem após o período de crise sanitária, e sabe-se que perdas educacionais têm impacto de longo prazo.
Ainda é mais significativo o que essa estimação significa no contexto dos dados utilizados – por se tratar do principal exame utilizado para ingresso no ensino superior no Brasil, uma diferença média de 12% nas notas implica em uma ampla vantagem na natureza concorrencial da seleção. 
As notas médias das edições do Enem seguem distribuição semelhante durante a série 2018-2021.

A nota média de corte para todos os cursos e de todas as universidades públicas divulgada pelo Sisu foi de 687,27 em 2020 e  682,33 em 2021. Aproximadamente 94% dos aplicantes obtiveram notas abaixo desses cortes nestas edições – demonstrando o quanto o acesso às universidades públicas é restrito no Brasil. Tendo em vista a magnitude da concorrência, se torna muito mais difícil a entrada de alunos sem acesso a essas tecnologias informacionais no ensino superior brasileiro, sendo esse fator em conjunto das outras desigualdades de oportunidades uma questão decisiva no alcance do ensino superior, em um país já marcado pela baixa mobilidade social.
Gráfico da distribuição cumulativa das notas médias calculadas nas edições do Enem 2020 e 2021. Linhas pretas representam as notas de cortes médias entre os cursos de todas universidades públicas brasileiras de suas respectivas edições. 
Um outro ponto, é que as estimativas realizadas levam em conta o caso de possuir ou não cada uma das tecnologias. Sabemos que a qualidade de conexão brasileira não é homogênea dentre o território, e em sua maior parte é deficitária. Estados do Nordeste possuem menor velocidade de conexão em comparação ao Sul e Sudeste, e no Norte esse cenário é ainda mais agravado. Isso indica que o efeito médio real em ter acesso a internet de qualidade pode ser ainda maior que o estimado; dado que uma boa conexão em banda larga, com qualidade suficiente de navegação pode agregar na aquisição de conhecimento dos alunos, tendo em vista a larga disponibilização de conteúdos educacionais disponíveis de forma gratuita online.
Mapa criado pelo SIMET (Nic.br). Disponível em https://qualidadedainternet.nic.br/
O acesso estimado de possuir o computador também é superior ao de possuir celular. Essa estimativa é esperada, visto que no computador têm-se uma qualidade de navegação mais propícia a realização de atividades produtivas, enquanto o celular é utilizado muitas vezes como ferramenta de entretenimento e para finalidades de socialização. Em pesquisa realizada pelo Datafolha em 2020 e mencionada em estudo do IDEC, 89% dos estudantes tinham acesso à aparelho celular em casa, mas “38% têm que dividir o aparelho com outras pessoas do domicílio” (IDEC, 2021).

## Métodos de Estimação
Regressão Quantílica

O método de regressão quantílica possui extensas aplicações na análise estatística,  e vêm sendo utilizado na literatura econômica e de estudos sociais. Diferentemente do método dos mínimos quadrados, utilizado na regressão linear clássica, a regressão quantílica é um método semiparamétrico por natureza (Petscher, Yaacov & Logan, 2013), pois não utiliza de premissas na distribuição dos erros (premissa de que os erros são aleatórios); ela se adapta à dados com heterocedasticidade (variância não constante ao longo da distribuição) além de se aplicar a contextos em que a variável dependente possui uma distribuição não-normal. A forma da regressão quantílica é mais complexa que a dos mínimos quadrados, e é resolvida através de programação linear, não sendo do enfoque deste trabalho. Para realizar as estimações de coeficientes para cada covariável em cada quantil da nota, utilizamos a expressão linear:
Qlog(Yi)(|X) = X´()
Sendo esta a função condicional ao quantil  da distribuição das notas, X a matriz de todas as covariáveis utilizadas no modelo;  o vetor dos coeficientes condicionados à cada -ésimo quantil. A ideia da transformação logarítmica da nota recebida pelos alunos é de investigar o efeito percentual atribuído a cada acréscimo marginal de cada variável.
As variáveis escolhidas como explicativas e utilizadas na modelagem foram:
Faixa etária do aluno;
Nível de educação do pai;
Nível de educação da mãe;
Quantidade de indivíduos morando na residência do aluno;
Renda familiar média, agrupada por faixas;
Índice de agregação para itens presentes na residência (itens como microondas, geladeira, televisão, máquina de lavar roupa);
Raça binarizada (pardos, negros e indígenas são não-brancos);
Gênero;
Estado civil;
Dependência administrativa da escola que estuda;
Indivíduo possui celular;
Indivíduo possui computador;
Indivíduo possui acesso à internet;
Coarsened Exact Matching (CEM)
O método denominado por Coarsened Exact Matching é um dos algoritmos de matching disponíveis para a estimação de efeitos causais em estudos quasi-experimentais. Vários são os algoritmos possíveis de se obter esse balanceamento entre os grupos de tratamento e controle, sendo o mais utilizado na literatura de ciências sociais aplicadas o “Propensity Scores Matching”. Entretanto, estudos realizados indicam que apesar do vasto uso, PSM aumenta a dependência do modelo, não garante a redução de desbalanceamento, dada a sua natureza randômica e não se comporta como em um experimento blocado onde há pares próximos de controle e tratamento (Iacus, Stefano & King, 2012). 
Coarsened Exact Matching consiste em discretizar as variáveis observadas e inserir em um mesmo grupo indivíduos que seriam estatisticamente semelhantes. A partir disso, adicionam-se pesos para cada observação de modo que as médias ponderadas do grupo de tratamento e controle em relação a cada uma das covariáveis tenha a menor distância possível, criando um cenário semelhante ao de um experimento “blocado”.
Para informações detalhadas, ler o artigo indicado nas referências.
