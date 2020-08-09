import boto3

# Funções
def criar_bucket():
  S3 = boto3.client('s3')
  S3.create_bucket(Bucket = BUCKET_NAME, CreateBucketConfiguration={'LocationConstraint': REGION_NAME})
  print(f'O bucket {BUCKET_NAME} foi criado com sucesso.')

def delete_bucket():
  S3 = boto3.client('s3')
  DELETE = S3.delete_bucket(Bucket=BUCKET_NAME)
  print(f'O bucket {BUCKET_NAME} foi deletado com sucesso.')

def listar_bucket():
  ACESSO_AWS=boto3.session.Session(profile_name="default")
  S3=ACESSO_AWS.resource(service_name="s3",region_name=REGION_NAME)
  for NAME_S3 in S3.buckets.all():
    print(NAME_S3)

REGION_NAME = 'us-east-2'

print('Ferramenta de administração do S3')

OP = int(input('''
Escolha uma operação

[1] - Listar buckets
[2] - Criar buckets
[3] - Deletar buckets

'''))

if OP == 1:
  listar_bucket()
elif OP == 2:
  BUCKET_NAME = str(input('Qual o nome do bucket: '))
  criar_bucket()
elif OP == 3:
  BUCKET_NAME = str(input('Qual o nome do bucket: '))
  delete_bucket()
else:
  print('Opção invalida')


# Para usar esta ferramenta tem que estar com a AWS cli configurada.