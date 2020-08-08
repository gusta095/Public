import boto3

# Criando acesso a AWS e o objeto S3
S3 = boto3.client('s3')

# Criando o bucket na AWS com o nome gusta-5264
S3.create_bucket(Bucket = 'gusta-5264', CreateBucketConfiguration={'LocationConstraint': 'us-east-2'})



