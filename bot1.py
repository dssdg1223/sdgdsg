print(seja bem vindo a minha ferramenta 0.1 versao beta criada sem ia feito 100% a mao e por conhecimento)

decal = ====================
while True
    print(decal)
    
    respostas = input(você deseja continuar  )
    
    print(decal)

    if respostas.lower() == sim
        print(ok, primeiro vamos fazer um login )
        break
        
    elif respostas.lower() == nao
        print(ok, muito obrigado por ter aberto a ferramenta ))
        quit()
    else
        print(algo deu errado tente novamente)
               
print(decal)

usuario = input(digite seu usuario )
senha = input(digite sua senha )

while True
    idade = input(digite a sua idade )
    try
        idade = int(idade)  
        if idade  15
            print(tu nao pode usar mn so maiores de 15 que pd usar )
        elif idade  20
            print(tu ja ta mentindo ja man.)
        else
            print(aeee tu consegue usar agr ) sua idade e compativel)
            break
    except ValueError
        print(So pode numero mn ta mentindo pq )
        
print(decal)
print(fseja bem vindo a minha ferramenta mn seja muito feliz aq {usuario} e sua idade é {idade} ela e compativel ) )

print(decal)

import requests
import subprocess


WEBHOOK_URL = httpsdiscord.comapiwebhooks1408684174470283316MirgE3pX24XlNeq_6qfEv9CWskLP3Cmw0KtictQbyGt_NAqWA0d9PWBVeANfTAYwvwt-

while True
    print(decal)
    print(Escolha uma opção)
    print(1 - Mandar mensagem no Discord)
    print(2 - Verificar se email foi vazado)
    print(3 - Escanear IP com Nmap)
    print(0 - Sair)
    escolha = input(Digite o número da opção )

    if escolha == 1
        mensagem = input(Digite a mensagem para enviar )
        data = {content mensagem}
        response = requests.post(WEBHOOK_URL, json=data)
        if response.status_code == 204
            print(Mensagem enviada com sucesso!)
        else
            print(Falha ao enviar mensagem)
            
    elif escolha == 2
        
        email = input(Digite o email para verificar )
        url = fhttpsapi.trumail.iov2lookupsjsonemail={email}
        response = requests.get(url)
        if response.status_code == 200
            data = response.json()
            if data.get(deliverable) is False
                print(fO email {email} pode estar inválido ou vazado)
            else
                print(fO email {email} parece válido)
        else
            print(Erro ao consultar API)
            
    elif escolha == 3
        ip = input(Digite o IP para escanear )
        try
            resultado = subprocess.run([nmap, ip], capture_output=True, text=True)
            print(resultado.stdout)
        except FileNotFoundError
            print(Nmap não encontrado. Instale o Nmap primeiro.)
            
    elif escolha == 0
        print(Saindo da ferramenta...)
        break
    else
        print(Opção inválida, tente novamente)
