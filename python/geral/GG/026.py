

FRASE = str(input('Digite uma frase: '))

QUANTI_A = FRASE.count('a')
FRIST_WORD = FRASE.find('a')
LAST_WORD = FRASE.rfind('a')

print(f'A letra "A" aparece {QUANTI_A} vezes')
print(f'A primeira vez que o "A" aparece é {FRIST_WORD + 1}')
print(f'A primeira vez que o "A" aparece é {LAST_WORD + 1}')