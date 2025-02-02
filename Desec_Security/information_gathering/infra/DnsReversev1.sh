#!/bin/bash

#Define códigos de escape ANSI
vermelho='\033[0;31m'
verde='\033[0;32m'
amarelo='\033[0;33m'
NC='\033[0m' # No Color
azul='\033[0;34m'
verde_negrito='\033[1;32m'

#Informações do script
echo
V="v1.0 DNS Reverse - Desec Security "
PROPRIETARIO="Danilo Antonio Rêgo"
LINK_REPOSITORIO="https://github.com/Danilo-Gith"

# Função para exibir o banner
print_banner() {
    echo -e "${amarelo}"
    figlet -f big "DNS Reverse"
    echo        
    echo -e "${V}"
    echo -e "Proprietário: ${PROPRIETARIO}"
    echo -e "Repositório: ${LINK_REPOSITORIO}${NC}"
}

#Chamada da função para exibir o banner
print_banner
echo #Quebra uma linha

#Verifica se o usuário forneceu os parâmetros corretamente <alvo_dns> <ip> <range_rede>
if [ $# -ne 3 ]; then
    echo -e "${vermelho}Uso: $0 <alvo_dns> <ip> <range_rede>${NC}"
    echo -e "${vermelho}Exemplo: $0 businesscorp.com.br 37.59.174 224-239${NC}"
    exit 1
fi

#Verifica se o usuário forneceu um alvo DNS o IP e o range de rede como argumento
alvo_dns="$1"
ip="$2"
range_rede="$3"

echo #Quebra uma linha
echo -e "${azul}**********************************************************************************${NC}"
echo -e "${azul}*                                                                                *${NC}"
echo -e "${azul}*       [+] Realizando Reverse de DNS em:${verde_negrito} -> $alvo_dns <- ${NC}             ${azul}*${NC}"  
echo -e "${azul}*                                                                                *${NC}"
echo -e "${azul}**********************************************************************************${NC}"

#Loop para realizar o Reverse de DNS no range de rede fornecido
for ip_range in $(seq $(echo "$range_rede" | cut -d '-' -f 1) $(echo "$range_rede" | cut -d '-' -f 2)); do
    echo -e "${verde_negrito}[+]${NC} $(host -t ptr $ip.$ip_range)"
   
done





