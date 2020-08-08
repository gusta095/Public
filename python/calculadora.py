
print('Calculadora v1')

def soma(VALOR1,VALOR2):
  print(f'{VALOR1} + {VALOR2} = {VALOR1 + VALOR2}')

def sub(VALOR1,VALOR2):
  print(f'{VALOR1} - {VALOR2} = {VALOR1 - VALOR2}')

def multi(VALOR1,VALOR2):
  print(f'{VALOR1} * {VALOR2} = {VALOR1 * VALOR2}')

def div(VALOR1,VALOR2):
  print(f'{VALOR1} / {VALOR2} = {VALOR1 / VALOR2:.0f}')


VALOR1 = int(input('Qual a primeira numero: '))
VALOR2 = int(input('Qual a segunda numero: '))

# VALOR1 = 4
# VALOR2 = 2

OP = int(input('''
Escolha uma operação

[1] - Soma
[2] - Subtração
[3] - Multiplicação
[4] - Divisão

'''))

if OP == 1:
  soma(VALOR1,VALOR2)
elif OP == 2:
  sub(VALOR1,VALOR2)
elif OP == 3:
  multi(VALOR1,VALOR2)
elif OP == 4:
  div(VALOR1,VALOR2)
else:
  print('Opção invalida')
