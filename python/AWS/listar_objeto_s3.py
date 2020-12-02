import boto3

BUCKET_NAME = 'gusta-origem'

def lista_todos_objetos():
  s3 = boto3.resource('s3')
  my_bucket = s3.Bucket(BUCKET_NAME)
  for file in my_bucket.objects.all():
    if "test-1/test-2/" in file.key:
      print(file.key)

lista_todos_objetos()

def busca_precisa():
  s3 = boto3.resource('s3')
  my_bucket = s3.Bucket(BUCKET_NAME)
  busca = str(input("palavra_chave: "))
  for file in my_bucket.objects.all():
    if busca in file.key:
      print(file.key)


