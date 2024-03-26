#!/bin/bash

# Define códigos de escape ANSI
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
NC='\033[0m' # No Color
azul='\033[0;34m'
verde_negrito='\033[1;32m'

# Informações do script
echo
V="v1.0 Ping Sweep - Desec Security "
PROPRIETARIO="Danilo Antonio Rêgo"
LINK_REPOSITORIO="https://github.com/Danilo-Gith"

# Função para exibir o banner
print_banner() {
    echo -e "${amarelo}"
    figlet -f big "Ping Sweep"
    echo        
    echo -e "${V}"
    echo -e "Proprietário: ${PROPRIETARIO}"
    echo -e "Repositório: ${LINK_REPOSITORIO}${NC}"
}

# Chamada da função para exibir o banner
print_banner
echo # Quebra uma linha

# Verifica se o usuário forneceu a rede como argumento
if [ $# -ne 1 ]; then
    echo -e "${vermelho}Uso: $0 <rede>${NC}"
    echo -e "${vermelho}Exemplo: $0 192.168.1${NC}"
    exit 1
fi

echo -e "${azul}**********************************************************************************${NC}"
echo -e "${azul}*                                                                                *${NC}"
echo -e "${azul}*   [+] Realizando Ping Sweep na rede:${verde_negrito} -> ${rede} <- ${NC}         ${azul}*${NC}"  
echo -e "${azul}*                                                                                *${NC}"
echo -e "${azul}**********************************************************************************${NC}"

rede="$1"


for ip in $(seq 1 254); do
    resultado=$(ping -c 1 "${rede}.$ip" -w 1 | grep "64 bytes" | cut -d " " -f4 | grep -v ":")
    echo -e "${verde_negrito}[+]${NC} $resultado"
done

