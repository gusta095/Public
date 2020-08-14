from googletrans import Translator
translator = Translator()

TEXT = translator.translate('good morning how are you',src='en',dest='portuguese')

print(TEXT)
print(TEXT.src)
print(TEXT.dest)
print(TEXT.text)


### REFERENCIA ###
# https://www.youtube.com/watch?v=fSOSstgIijs
# pip3 install googletrans