import math

ca = float(input('Qual o valor do catedo adjacente: '))
co = float(input('Qual o valor do cateto oposto: '))

print(f'O valor da hipotenusa é {math.hypot(ca,co):.2f}')
