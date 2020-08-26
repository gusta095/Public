
print('Leitura de arquivo')

arquivo = open('leitura.csv')
dados = arquivo.read()
arquivo.close()

for c in dados.splitlines():
  print('Nome: {}, Idade: {}'.format(*c.split(',')))