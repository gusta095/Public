import csv
import json

with open('leitura.csv') as f:
    reader = csv.reader(f)
    rows = list(reader)
    # for c in csv.reader(f):
    #   print('Nome: {}, Idade {}'.format(*c))

with open('test.json', 'w') as f:
    json.dump(rows, f)
