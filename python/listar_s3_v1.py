import boto3

# Conexão com a AWS
ACESSO_AWS=boto3.session.Session(profile_name="default")

# Criando o objeto S3
S3=ACESSO_AWS.resource(service_name="s3",region_name="us-east-2")

# Listar buckets por nome
for NAME_S3 in S3.buckets.all():
  print(NAME_S3)

# Teste de conexão
# print(S3.buckets.all())