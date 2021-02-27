from datetime import datetime
import requests
import json

REQUEST = requests.get('https://economia.awesomeapi.com.br/all/USD-BRL,EUR-BRL')

JSON = json.loads(REQUEST.text)
DOLAR_ATUAL = JSON['USD']['ask']
DOLAR_MAX = JSON['USD']['high']
DOLAR_MIN = JSON['USD']['low']
HORA = datetime.now().strftime('%H:%M:%S %d-%m-%Y')
EUR_ATUAL = JSON['EUR']['ask']
EUR_MAX = JSON['EUR']['high']
EUR_MIN = JSON['EUR']['low']

print(f'''
CONSULTA RAPIDA
Hora da consulta: {HORA}

DOLAR

Atual:   {DOLAR_ATUAL[:4]}
Maximo:  {DOLAR_MAX[:4]}
Minimo:  {DOLAR_MIN[:4]}

EURO

Atual:   {EUR_ATUAL[:4]}
Maximo:  {EUR_MAX[:4]}
Minimo:  {EUR_MIN[:4]}
''')

# Mostra o valor do dolar e do euro.