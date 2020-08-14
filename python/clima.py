from googletrans import Translator
import requests
import json

print('Clima Python')

CIDADE = str(input('Qual é sua cidade: ')).lower().strip()
KEY = '4e107063ae3f4dac0b4d9952ca8f411f'
CLIMA = requests.get(f'http://api.openweathermap.org/data/2.5/weather?q={CIDADE}&appid={KEY}')
translator = Translator()

JSON = json.loads(CLIMA.text)
TEMP_ATUAL = JSON['main']['temp'] - 273
TEMP_MIN = JSON['main']['temp_min'] - 273
TEMP_MAX = JSON['main']['temp_max'] - 273
TEMPO = JSON['weather'][0]['main']
TEXT = translator.translate(f'{TEMPO}',src='en',dest='portuguese')

print(f'''
Cidade analisada:   {CIDADE.capitalize()}
Tempo:              {TEXT.text}
Temperatura atual:  {TEMP_ATUAL:.1f} Cº
Temperatura max:    {TEMP_MAX:.1f} Cº
Temperatura min:    {TEMP_MIN:.1f} Cº
''')

