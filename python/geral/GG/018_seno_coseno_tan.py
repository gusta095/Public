import math

angulo = float(input('Qual o angulo: '))

print(f'''
Angulo analisado {angulo:.0f}

Cosseno - {math.cos(angulo):.2f}
Seno - {math.sin(angulo):.2f}
Tangente - {math.tan(angulo):.2f}

''')