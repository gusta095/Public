
PC_PEDRA = 1
PC_PAPEL = 2
PC_TESOURA = 3

PESSOA_PEDRA = 1
PESSOA_PAPEL = 0
PESSOA_TESOURA = 0

if PESSOA_PEDRA < PC_PAPEL:
  print(f'O vencedor foi a Papel')
elif PESSOA_PEDRA < PC_TESOURA:
  print(f'O vencedor foi a PEDRA')
elif PESSOA_PEDRA == PC_PEDRA:
  print(f'EMPATE')
else:
  print('Opção invalida')

  PESSOA_PEDRA == PC_PEDRA