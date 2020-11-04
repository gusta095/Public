import boto3
s3 = boto3.resource('s3')

BUCKET_NAME = 'gusta-origem'

# Lista todos os objetos do bucket
def lambda_handler(event, context):
  my_bucket = s3.Bucket(BUCKET_NAME)
  for file in my_bucket.objects.all():
    print(file.key)


# Lista os objetos buscando por uma palavra
def lambda_handler(event, context):
  my_bucket = s3.Bucket(BUCKET_NAME)
  for file in my_bucket.objects.all():
    if "card" in file.key:
      print(file.key)
