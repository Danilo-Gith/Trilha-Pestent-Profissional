import socket

def port_scan(target_host, portas):
    
    #Loop pelos portas no alvo
    for port in portas:
        
        # Cria um objeto socket
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.settimeout(1)#Define um timeout de 1 segundo

        #Tenta se conectar ao host na porta alvo
        try:
            client.connect((target_host, port))
            print(f'Porta {port}/TCP - Aberta')
        except:
            print(f'Porta {port}/TCP - Fechada')
        finally:
            client.close()

# Define o host alvo e as portas a serem verificadas
target_host = input("\nDigite o endereço IP do alvo: \n")
portas = [21, 22, 80, 443, 80801, 53]  # Exemplo de portas a serem verificadas

# Chama a função port_scan para realizar o scan
port_scan(target_host, portas)
