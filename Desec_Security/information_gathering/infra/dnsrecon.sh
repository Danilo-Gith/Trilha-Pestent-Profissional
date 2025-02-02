#!/bin/bash

# Define códigos de escape ANSI para cores
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
NC='\033[0m' # No Color
azul='\033[0;34m'
verde_negrito='\033[1;32m'
 
# Informações do script
echo
V="v1.0 DNS Recon - Desec Security "
PROPRIETARIO="Danilo Antonio Rêgo"
LINK_REPOSITORIO="https://github.com/Danilo-Gith"

#Função para exibir o banner
print_banner() {
   
    echo -e "${amarelo}"
    figlet -f big "DNS Recon"
    echo        
    echo -e "${V}"
    echo -e "Proprietário: ${PROPRIETARIO}"
    echo -e "Repositório: ${LINK_REPOSITORIO}${NC}"
}
 
#Chamada da função para exibir o banner
print_banner
echo
 
#Verifica se o usuário forneceu um alvo e a wordlist como argumento
if [ $# -ne 2 ]; then
    echo -e "${vermelho}Uso: $0 <alvo> <wordlist>${NC}"
    echo -e "${vermelho}Exemplo: $0 busniesscorp.com.br lista.txt${NC}"
    exit 1
fi
 
#Definindo os parâmetros alvo + wordlist
alvo="$1"
lista="$2"

echo
echo -e  "${azul}**********************************************************************************${NC}"
echo -e  "${azul}*                                                                                *${NC}"
echo -e  "${azul}*         [+] Realizando Recon de DNS em:${verde_negrito} -> $alvo <- ${NC}             ${azul}*${NC}"  
echo -e  "${azul}*                                                                                *${NC}"
echo -e  "${azul}**********************************************************************************${NC}"

for palavra in $(cat "$lista"); do
    resultado=$(host  "$palavra.$1" | grep -v "NXDOMAIN" | grep -v "timed out")
    if [ ! -z "$resultado" ]; then
        echo -e "${verde_negrito}[+]${NC} $resultado"
    fi
done

