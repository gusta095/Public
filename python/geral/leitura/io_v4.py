
print('Leitura de arquivo v2')

try:
  arquivo = open('leitura.csv')

  for c in arquivo:
    print('Naome: {}, Idade: {}'.format(*c.strip().split(',')))

finally:
  arquivo.close()

