import random

Lista = []

for c in range(1,5):
  ALUNOS = str(input('Digite o nome dos alunos: ')).strip().capitalize()
  Lista.append(ALUNOS)

SORTE = random.choice(Lista)

print(f'O alunos escolhido foi {SORTE}')