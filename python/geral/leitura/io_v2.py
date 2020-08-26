
print('Leitura de arquivo v2')

arquivo = open('leitura.csv')

for c in arquivo:
  print('Naome: {}, Idade: {}'.format(*c.split(',')), end='')
arquivo.close()