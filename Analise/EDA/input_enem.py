r_input_dict = {
    'TP_FAIXA_ETARIA':{
        'levels':[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
        'labels':['Menor de 17 anos','17 anos','18 anos','19 anos','20 anos','21 anos','22 anos',
        '23 anos','24 anos','25 anos','Entre 26 e 30 anos','Entre 31 e 35 anos','Entre 36 e 40 anos',
        'Entre 41 e 45 anos','Entre 46 e 50 anos','Entre 51 e 55 anos','Entre 56 e 60 anos','Entre 61 e 65 anos',
        'Entre 66 e 70 anos','Maior de 70 anos']
    },
    'TP_SEXO':{ 
        'levels': ['M','F'], 
        'labels':['Maculino','Feminino']
    },
    'TP_ESTADO_CIVIL':{
        'levels':[0,1,2,3,4],
        'labels':['Não informado',
                'Solteiro(a)',
                'Casado(a)/Mora com um(a) companheiro(a)',
                'Divorciado(a)/Desquitado(a)/Separado(a)',
                'Vivo(a)']
    },
    'TP_COR_RACA':{
        'levels':[0,1,2,3,4,5,6],
        'labels':['Não declarado',
                'Branca','Preta',
                'Parda','Amarela',
                'Indígena',
                'Não dispõe da informação']
    },
    'TP_ESCOLA':{
        'levels':[1,2,3,4],
        'labels':['Não respondeu',
                'Pública',
                'Privada',
                'Exterior']
    },
    'TP_LOCALIZACAO_ESC':{
        'levels':[1,2],
        'labels':['Urbana','Rural']
    },
    'Q001':{
        'levels':['A','B','C','D','E','F','G','H'],
        'labels':['Nunca estudou',
                'Não completou o 5 ano do EF',
                'Completou o 5 ano, mas não completou o 9 ano do EF',
                'Completou o 9 ano do EF, mas não completou o EM',
                'Completou o EM, mas não completou a Faculdade',
                'Completou a Faculdade, mas não completou a pós-graduação',
                'Completou a pós-graduação','não sei']
    },
    'Q002':{
        'levels':['A','B','C','D','E','F','G','H'],
        'labels':['Nunca estudou',
                'Não completou o 5 ano do EF',
                'Completou o 5 ano, mas não completou o 9 ano do EF',
                'Completou o 9 ano do EF, mas não completou o EM',
                'Completou o EM, mas não completou a Faculdade',
                'Completou a Faculdade, mas não completou a pós-graduação',
                'Completou a pós-graduação','não sei']
    },
    'Q003':{
        'levels':['A','B','C','D','E','F'],
        'labels':['Grupo 1',
                'Grupo 2',
                'Grupo 3',
                'Grupo 4',
                'Grupo 5',
                'Não Sei']
    },
    'Q004':{
        'levels':['A','B','C','D','E','F'],
        'labels':['Grupo 1',
                'Grupo 2',
                'Grupo 3',
                'Grupo 4',
                'Grupo 5',
                'Não Sei']
    },
    'Q006':{
        'levels':['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q'],
        'labels':['Nenhuma renda.',
                'Até R$ 998,00',
                'De R$ 998,01 até R$ 1.497,00',
                'De R$ 1.497,01 até R$ 1.996,00',
                'De R$ 1.996,01 até R$ 2.495,00',
                'De R$ 2.495,01 até R$ 2.994,00',
                'De R$ 2.994,01 até R$ 3.992,00',
                'De R$ 3.992,01 até R$ 4.990,00',
                'De R$ 4.990,01 até R$ 5.988,00',
                'De R$ 5.988,01 até R$ 6.986,00',
                'De R$ 6.986,01 até R$ 7.984,00',
                'De R$ 7.984,01 até R$ 8.982,00',
                'De R$ 8.982,01 até R$ 9.980,00',
                'De R$ 9.980,01 até R$ 11.976,00',
                'De R$ 11.976,01 até R$ 14.970,00',
                'De R$ 14.970,01 até R$ 19.960,00',
                'Mais de R$ 19.960,00']
    },
    'Q007':{
        'levels':['A','B','C','D'],
        'labels':['Não','Sim, um ou dois dias por semana',
                'Sim, três ou quatro dias por semana',
                'Sim, pelo menos cinco dias por semana']
    },
    'Q008':{
        'levels':['A','B','C','D','E'],
        'labels':['Não',
                'Sim, um',
                'Sim, dois',
                'Sim, três',
                'Sim, quatro ou mais']
    },
    'Q009':{
        'levels':['A','B','C','D','E'],
        'labels':['Não',
                'Sim, um',
                'Sim, dois',
                'Sim, três',
                'Sim, quatro ou mais']
    },
    'Q010':{
        'levels':['A','B','C','D','E'],
        'labels':['Não',
                'Sim, um',
                'Sim, dois',
                'Sim, três',
                'Sim, quatro ou mais']
    },
    'Q012':{
        'levels':['A','B','C','D','E'],
        'labels':['Não',
                'Sim, um',
                'Sim, dois',
                'Sim, três',
                'Sim, quatro ou mais']
    },
    'Q019':{
        'levels':['A','B','C','D','E'],
        'labels':['Não',
                'Sim, um',
                'Sim, dois',
                'Sim, três',
                'Sim, quatro ou mais']
    },
    'Q022':{
        'levels':['A','B','C','D','E'],
        'labels':['Não',
                'Sim, um',
                'Sim, dois',
                'Sim, três',
                'Sim, quatro ou mais']
    },
    'Q024':{
        'levels':['A','B','C','D','E'],
        'labels':['Não',
                'Sim, um',
                'Sim, dois',
                'Sim, três',
                'Sim, quatro ou mais']
    },
    'Q025':{
        'levels':['A','B'],
        'labels':['Não','Sim']
    }
}

cols_names = {
    'Q001':'Até que série seu pai estudou?',
    'Q002':'Até que série sua mãe estudou?',
    'Q003':'Grupo de ocupação mais próxima do seu pai',
    'Q004':'Grupo de ocupação mais próxima da sua mãe',
    'Q006':'Renda mensal familiar',
    'Q007':'Tem empregada doméstica',
    'Q008':'Banheiro em casa',
    'Q009':'Quartos para dormir',
    'Q010':'Residência tem carro',
    'Q012':'Resiência tem geladeira',
    'Q019':'Residência tem TV',
    'Q022':'Residência tem celular',
    'Q024':'Residência tem computador',
    'Q025':'Residência tem internet',
}

categorical_labels = {}

for key in r_input_dict.keys():
    categorical_labels[key] = {i[0]: i[1] for i in zip(r_input_dict[key]['levels'], r_input_dict[key]['labels'])}
