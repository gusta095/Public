X = input('Digite algo: ')

print(f'O tipo primitivo é {type(X)}')
print(f'Está vazio {X.isspace()}')
print(f'É um numero {X.isnumeric()}')
print(f'É uma letra {X.isalpha()}')
