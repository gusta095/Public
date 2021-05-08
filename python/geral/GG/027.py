

NOME_COMPLETO = str(input('Digite o nome: ')).strip()

FILTER = NOME_COMPLETO.split()

# LAST = len(FILTER)
# print(LAST)

print(f'Primeiro {FILTER[0]}')
print('ultimo {}'.format(FILTER[len(FILTER)-1]))
