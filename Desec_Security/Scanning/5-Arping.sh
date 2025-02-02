#!/bin/bash

# Script para realizar ARP Recon em uma rede

#Define códigos de escape ANSI
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
NC='\033[0m' # No Color
azul='\033[0;34m'
verde_negrito='\033[1;32m'

#Informações do script
echo
V="v1.0 ARP Ping - Desec Security"
PROPRIETARIO="Danilo Antonio Rêgo"
LINK_REPOSITORIO="https://github.com/Danilo-Gith"

# Função para exibir o banner
print_banner() {
    echo -e "${amarelo}"
    figlet -f big "ARP Recon"
    echo        
    echo -e "${V}"
    echo -e "Proprietário: ${PROPRIETARIO}"
    echo -e "Repositório: ${LINK_REPOSITORIO}${NC}"
}

#Chamada da função para exibir o banner
print_banner
echo

# Verifica se o usuário forneceu a rede e o range de IP como argumentos
if [ $# -ne 3 ]; then
    echo -e "${vermelho}Uso: $0 <rede> <inicio_intervalo> <fim_intervalo>${NC}"
    echo -e "${vermelho}Exemplo: $0 192.168.1 224 239${NC}"
    exit 1
fi

rede="$1"
inicio_intervalo="$2"
fim_intervalo="$3"

echo -e "${azul}*******************************************************************************${NC}"
echo -e "${azul}*                                                                                *${NC}"
echo -e "${azul}*   [+] Realizando ARP Recon na rede:${verde_negrito} -> ${rede} <- ${NC}         ${azul}*${NC}"  
echo -e "${azul}*                                                                                *${NC}"
echo -e "${azul}********************************************************************************${NC}"

#Loop para realizar o ARP Recon em cada IP do range fornecido
for ip in $(seq $inicio_intervalo $fim_intervalo); do
    resultado=$(arping -c 1 "$rede.$ip" | grep "60 bytes")
    if [ -n "$resultado" ]; then
        echo -e "${verde_negrito}[+]${NC} $resultado"
    fi
done