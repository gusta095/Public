import boto3

# Cria o acesso a AWS e o objeto s3
S3 = boto3.client('s3')

# Nome do bucket que vai ser deletado
BUCKET_NAME = 'gusta-5264'

# Ação que vai ser executada no bucket
DELETE = S3.delete_bucket(Bucket=BUCKET_NAME)