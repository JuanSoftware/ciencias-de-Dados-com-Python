usuario = 0
limite_saque = 0
saques = []
depositos = []

def menu():
    print("Digite 1 para extrato, 2 para saque e 3 para depósito")
    telaInicial = input("Digite a opção que você deseja: ")
    if telaInicial == "1":
        extrato()
    elif telaInicial == "2":
        saque()
    elif telaInicial == "3":
        deposito()
    else:
        print("Comando inválido")
        menu()

def extrato():
    print(f"Seu saldo atual é de R$ {format(usuario, '.2f')}")
    print("Saques:")
    for saque in saques:
        print(f"- R$ {format(saque, '.2f')}")
    print("Depósitos:")
    for deposito in depositos:
        print(f"+ R$ {format(deposito, '.2f')}")
    menu()

def saque():
    global usuario, limite_saque
    if limite_saque < 3:
        print("Digite o valor que deseja sacar: ")
        valor_saque = int(input())
        if valor_saque <= 500 and valor_saque <= usuario:
            usuario -= valor_saque
            limite_saque += 1
            saques.append(valor_saque)
            print(f"Você sacou R$ {format(valor_saque, '.2f')}. Seu saldo atual é R$ {format(usuario, '.2f')}")
        else:
            print("Valor acima do limite de saque ou do saldo da conta")
    else:
        print("Limite de saques diários atingido")
    menu()

def deposito():
    global usuario
    valor_deposito = int(input("Digite o valor que você deseja depositar: "))
    usuario += valor_deposito
    depositos.append(valor_deposito)
    print(f"Você depositou R$ {format(valor_deposito, '.2f')}. Seu saldo atual é R$ {format(usuario, '.2f')}")
    menu()

menu()
