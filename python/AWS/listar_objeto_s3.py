import boto3

BUCKET_NAME = 'test-2-gusta095'

def listar_objetos():
  s3 = boto3.resource('s3')
  my_bucket = s3.Bucket(BUCKET_NAME)
  for file in my_bucket.objects.all():
    print(file.key)

listar_objetos()
