import boto3

BUCKET_NAME = 'test-2-gusta095'
PATH_FILE = 'test/card-invoice-build-134.txt'
FILE_NAME = 'card-invoice-build-134.txt'

def baixar_objeto():
  s3 = boto3.resource('s3')
  s3.Bucket(BUCKET_NAME).download_file(PATH_FILE, '/mnt/c/Users/gusta/Projetos/Public/python/'+FILE_NAME)

baixar_objeto()