from tqdm import tqdm
import time

#Cria uma linha tracejada para formatar o print
def borda_cabeçalho(borda=65):
    return '-' * borda

#Cria centralização da linha tracejada para formatar o print
def cabeçalho(titulo):
    print(borda_cabeçalho())
    print(titulo.center(70))
    print(borda_cabeçalho())

#Cria centralização da linha tracejada para formatar o print
def borda_cabeçalho2(borda=145):
    return '-' * borda

#Cria centralização da linha tracejada para formatar o print
def cabeçalho2(titulo):
    print(borda_cabeçalho2())
    print(titulo.center(145))
    print(borda_cabeçalho2())

#Função que reliza uma barra de progresso
def carregando():
# Define o número de iterações do loop
    total_iteracoes = 100

    # Utiliza a função `tqdm` para envolver o range e exibir a barra de progresso
    for i in tqdm(range(total_iteracoes)):
        # Simula algum trabalho sendo realizado
        time.sleep(0.1)



def cor_vermelho(texto):
    return f'\033[0;31m{texto}\033[0m'

def cor_verde(texto):
    return f'\033[0;32m{texto}\033[0m'

def cor_amarelo(texto):
    return f'\033[0;33m{texto}\033[0m'

def cor_amarelo_negrito(texto):
    return f'\033[1;33m{texto}\033[0m'

def cor_azul(texto):
    return f'\033[0;34m{texto}\033[0m'

def cor_verde_negrito(texto):
    return f'\033[1;32m{texto}\033[0m'

def cor_azul_negrito(texto):
    return f'\033[1;34m{texto}\033[0m'
