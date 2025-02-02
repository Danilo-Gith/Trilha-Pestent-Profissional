#!/bin/bash

# Define códigos para cores
vermelho='\033[0;31m'
amarelo_negrito='\033[1;33m'
verde='\033[0;32m'
amarelo='\033[0;33m'
NC='\033[0m'
azul='\033[0;34m'
azul_negrito='\033[1;34m' 
verde_negrito='\033[1;32m'

# Informações do script
echo
V="v1.0 Web Recon - Desec Security "
PROPRIETARIO="Danilo Antonio Rêgo"
LINK_REPOSITORIO="https://github.com/Danilo-Gith"

# Função para exibir o banner
print_banner() {
    echo -e "${amarelo_negrito}"
    figlet -f big "Web Recon"
    echo        
    echo -e "${V}"
    echo -e "Proprietário: ${PROPRIETARIO}"
    echo -e "Repositório: ${LINK_REPOSITORIO}${NC}"
}

#Chamada da função para exibir o banner
print_banner
echo

#Verifica se o usuário forneceu um alvo, wordlist e extensão como argumentos
if [ $# -ne 2 ]; then
    echo -e "${vermelho}Uso: $0 <alvo> <wordlist>${NC}"
    echo -e "${vermelho}Exemplo: $0 http://exemplo.com.br lista.txt${NC}"
    exit 1
fi

# Definindo os parâmetros alvo, wordlist e extensão
alvo="$1"
lista="$2"
extensao=("php" "js" "css" "txt" "wp") #Definação de array para localizar aquivos com as extensões informadas na variavel extensao

resp_server=$(curl -v -s -H "User-Agent: Chrome/98.0.4758.101 Mobile Safari/537.36" -o /dev/null "http://$alvo" 2>&1 | grep "Server" | cut -d " " -f2-)

echo
echo -e "${azul}**********************************************************************************${NC}"
echo -e "${azul}*                                                                                *${NC}"
echo -e "${azul}*      [+] Realizando busca por Diretórios em:${verde_negrito} -> $alvo <-${NC}      ${azul}*${NC}"  
echo -e "${azul}*                                                                                *${NC}"
echo -e "${azul}**********************************************************************************${NC}"
echo
echo -e "${azul_negrito}--> WebServer identificado:${NC}${verde_negrito} ${resp_server}${NC}"
echo

#Realiza o curl pegando apenas status code 200 para localizar o diretório encontrado na lista
for palavra in $(cat "$lista"); do
    resp_dir=$(curl -s -H "User-Agent: Chrome/98.0.4758.101 Mobile Safari/537.36" -o /dev/null -w "%{http_code}" "${alvo}/${palavra}/")
    if [ "$resp_dir" == "200" ]; then
        echo -e "${azul_negrito}[+] Diretório identificado:${NC}${verde_negrito} htttp://$alvo/$palavra${NC}"
    fi
done


echo
echo -e "${azul}**********************************************************************************${NC}"
echo -e "${azul}*                                                                                *${NC}"
echo -e "${azul}*      [+] Realizando busca por Arquivos em:${verde_negrito} -> $alvo <-${NC}        ${azul}*${NC}"  
echo -e "${azul}*                                                                                *${NC}"
echo -e "${azul}**********************************************************************************${NC}"
echo

#Realiza o curl pegando apenas status code 200 para localizar o diretório com as extensão informando na array
for palavra in $(cat "$lista"); do
    for ext in "${extensao[@]}"; do  # Itera sobre cada elemento do array 'extensao'
        resp_arq=$(curl -s -H "User-Agent: Chrome/98.0.4758.101 Mobile Safari/537.36" -o /dev/null -w "%{http_code}" "${alvo}/${palavra}.${ext}")
        if [ "$resp_arq" == "200" ]; then
            echo -e "${azul_negrito}[+] Arquivo identificado:${NC}${verde_negrito} http://${alvo}/${palavra}.${ext}${NC}"
        fi
    done
done
