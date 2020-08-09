import boto3

# Criando acesso a AWS e o objeto S3
S3 = boto3.client('s3')

# Nome do bucket
BUCKET_NAME = 'gusta-05020604'

# Criando o bucket na AWS com o nome gusta-5264
S3.create_bucket(Bucket = BUCKET_NAME, CreateBucketConfiguration={'LocationConstraint': 'us-east-2'})



