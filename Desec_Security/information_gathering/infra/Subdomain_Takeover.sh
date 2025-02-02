#!/bin/bash

#Define códigos para cores
vermelho='\033[0;31m'
amarelo_negrito='\033[1;33m'
verde='\033[0;32m'
amarelo='\033[0;33m'
NC='\033[0m' 
azul='\033[0;34m'
verde_negrito='\033[1;32m'

#Informações do script
echo
V="v1.0 Subdomain Takeover - Desec Security "
PROPRIETARIO="Danilo Antonio Rêgo"
LINK_REPOSITORIO="https://github.com/Danilo-Gith"

#Função para exibir o banner
print_banner() {
    echo -e "${amarelo_negrito}"
    figlet -f big "Sub Takeover"
    echo        
    echo -e "${V}"
    echo -e "Proprietário: ${PROPRIETARIO}"
    echo -e "Repositório: ${LINK_REPOSITORIO}${NC}"
}

# Chamada da função para exibir o banner
print_banner
echo

#Verifica se o usuário forneceu um alvo e a wordlist como argumento
if [ $# -ne 2 ]; then
    echo -e "${vermelho}Uso: $0 <alvo> <wordlist>${NC}"
    echo -e "${vermelho}Exemplo: $0 businesscorp.com.br lista.txt${NC}"
    exit 1
fi

#Definindo os parâmetros alvo + wordlist
alvo="$1"
lista="$2"
echo
echo -e "${azul}**********************************************************************************${NC}"
echo -e "${azul}*                                                                                *${NC}"
echo -e "${azul}*      [+] Realizando Subdomain Takeover em:${verde_negrito} -> $alvo <- ${NC}           ${azul}*${NC}"  
echo -e "${azul}*                                                                                *${NC}"
echo -e "${azul}**********************************************************************************${NC}"

#Loop para resolver os Cname do DNS encontrados
for palavra in $(cat "$lista"); do
    resultado=$(host -t cname "$palavra.$1" | grep -E "alias for")
    if [ ! -z "$resultado" ]; then
        echo -e "${verde_negrito}[+]${NC} $resultado"
    fi
done
