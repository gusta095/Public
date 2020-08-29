dias = int(input('Quantos dias ficou com o carros: '))
kms = int(input('Quantos KMs foram percorridos: '))

custo_dia = dias * 60
custo_km = kms * 0.15

print(f'O valor do aluguel vai ser de R${custo_dia + custo_km}')