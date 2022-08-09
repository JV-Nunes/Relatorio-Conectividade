import dask.dataframe as dd

def get_medium_score(df):
    ling = df['NU_NOTA_LC']
    hum = df['NU_NOTA_CH']
    nat = df['NU_NOTA_CN']
    mat = df['NU_NOTA_MT']
    red = df['NU_NOTA_REDACAO']

    media = (ling + hum + nat + red + mat) / 5

    return media

def dask_load_year_enem(year, cols):
    enem = dd.read_csv(
        f'../../Dados/Enem/microdados_enem_{year}/DADOS/MICRODADOS_ENEM_{year}.csv',
        usecols = cols,
        sep = ';',
        header = 0,
        #nrows=300*1000,
        encoding='latin-1',
        dtype={'NO_MUNICIPIO_ESC': 'object',
           'SG_UF_ESC': 'object',
           'CO_MUNICIPIO_ESC': 'object'},
        assume_missing=True
    )
    return enem


def filter_enem(df):
    pre_filter = len(df)
    print('Tamanho do dataset pré-filtragem: ', pre_filter)

    # Aplicando filtragem dos dados
    df = df[df['IN_TREINEIRO']==0] # Não é treineiro
    df = df[df['TP_ENSINO']==1] # Ensino Regular
    df = df[df['TP_ST_CONCLUSAO']!=4] # Está cursando ensino médio ou já cursou
    df = df[df['TP_ANO_CONCLUIU']<=1] # Está cursando ou concluiu o ensino médio até 2018
    df = df[df['TP_NACIONALIDADE']==1] # Brasileiro

    # Removendo colunas pós filtragem
    df = df.drop(columns=['TP_ENSINO','IN_TREINEIRO','TP_ANO_CONCLUIU','TP_NACIONALIDADE','TP_ST_CONCLUSAO']) 

    post_filter = len(df)
    print('Tamanho do dataset pós-filtragem: ', post_filter)
    print('Taxa de filtragem: ', (pre_filter-post_filter)/pre_filter)
    return df

def clean_dataset(df):
    assert isinstance(df, pd.DataFrame), "df needs to be a pd.DataFrame"
    df.dropna(inplace=True)
    indices_to_keep = ~df.isin([np.inf, -np.inf]).any(1)
    return df[indices_to_keep].astype(np.float64)

def load_trienio_enem(cols):
    enem19 = filter_enem(dask_load_year_enem(2019, cols))
    enem20 = filter_enem(dask_load_year_enem(2020, cols))
    enem21 = filter_enem(dask_load_year_enem(2021, cols))
    return dd.concat([enem19, enem20, enem21])