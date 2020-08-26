import random

print('Jokenpô')

# Sorteio da maquina
PC_PEDRA = 1
PC_PAPEL = 2
PC_TESOURA = 3

MAQUINA = [ PC_PEDRA,PC_PAPEL,PC_TESOURA ]
SORTEIO = random.choice(MAQUINA)

print(f'{SORTEIO}')

# Escolha da pessoa
OP = int(input('''
Escolha uma opção

[1] - Pedra
[2] - Papel
[3] - Tesoura

'''))

PESSOA_PEDRA = 0
PESSOA_PAPEL = 0
PESSOA_TESOURA = 0

if OP == 1:
  PESSOA_PEDRA = 1
elif OP == 2:
  PESSOA_PAPEL = 2
elif OP == 3:
  PESSOA_TESOURA = 3
else:
  print('Opção invalida')

# Avaliação

if PESSOA_PEDRA == PC_PEDRA:
  print(f'EMPATE')
elif PESSOA_PEDRA == PC_TESOURA:
  print(f'O vencedor foi a PEDRA')
elif PESSOA_PEDRA == PC_PAPEL:
  print(f'O vencedor foi o PAPEL')
elif PESSOA_PAPEL == PC_PAPEL:
  print(f'EMPATE')
elif PESSOA_PAPEL == PC_PEDRA:
  print(f'O vencedor foi o PAPEL')
elif PESSOA_PAPEL == PC_TESOURA:
  print(f'O vencedor foi a TESOURA')
elif PESSOA_TESOURA == PC_TESOURA:
  print(f'EMPATE')
elif PESSOA_TESOURA == PC_PEDRA:
  print(f'O vencedor foi a PEDRA')
elif PESSOA_TESOURA == PC_PAPEL:
  print(f'O vencedor foi o PEPAL')
else:
  print('Opção invalida')