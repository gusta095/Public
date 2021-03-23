import boto3
import codecs

REGION_NAME = 'us-east-1'
AWS_PROFILE = 'default'

BUCKET_NAME = 'bucket_name'
FILE_PATH = 'test/test2/test.txt'
BUCKET_FILE_NAME = 'teste.txt'
LOCAL_FILE_NAME = '/tmp/teste.txt'
# LOCAL_FILE_NAME = 'teste.txt'

# create bucket

def simple_create_bucket():
    CREATE_BUCKET_NAME = 'BUCKET_NAME'
    S3 = boto3.client('s3')
    S3.create_bucket(Bucket=CREATE_BUCKET_NAME, CreateBucketConfiguration={'LocationConstraint': REGION_NAME})
    print(f'O bucket {CREATE_BUCKET_NAME} foi criado com sucesso.')

# deletar bucket

def delete_bucket():
    DELETE_BUCKET_NAME = 'BUCKET_NAME'
    S3 = boto3.client('s3')
    S3.delete_bucket(Bucket=DELETE_BUCKET_NAME)
    print(f'O bucket {DELETE_BUCKET_NAME} foi deletado com sucesso.')

# listar bucket

def list_bucket():
    ACESSO_AWS = boto3.session.Session(profile_name=AWS_PROFILE)
    S3 = ACESSO_AWS.resource(service_name="s3", region_name=REGION_NAME)
    for NAME_S3 in S3.buckets.all():
        print(NAME_S3)

# lista objetos do bucket 1

def list_all_objects():
    s3 = boto3.resource('s3')
    my_bucket = s3.Bucket(BUCKET_NAME)
    for file in my_bucket.objects.all():
        print(file.key)

# listar objetos do bucket 2

def list_all_objects_details():
    s3 = boto3.resource('s3')
    my_bucket = s3.Bucket(BUCKET_NAME)
    for file in my_bucket.objects.all():
        print(f'''
        Nome: {file.key}
        Tamanho: {file.size}
        Data: {file.last_modified}''')

# buscar objetos por palavras chaves no s3

def search_objects():
    s3 = boto3.resource('s3')
    my_bucket = s3.Bucket(BUCKET_NAME)
    for file in my_bucket.objects.all():
        if "test" in file.key:
            print(file.key)

# baixar obejotos do S3

def download_s3_file():
    s3 = boto3.client('s3')
    s3.download_file(BUCKET_NAME, BUCKET_FILE_NAME, LOCAL_FILE_NAME)

# fazer streaming de arquivo 

def streaming_file():
    s3 = boto3.resource('s3')
    my_bucket = s3.Object(BUCKET_NAME, FILE_PATH)
    line_steam = codecs.getreader('utf-8')
    for line in line_steam(my_bucket.get(Range=f'bytes={0}-{(641*200000)}')['Body']):
        print(line)

# streaming para um arquivo 

def streaming_to_file():
    s3 = boto3.resource('s3')
    my_bucket = s3.Object(BUCKET_NAME, FILE_PATH)
    line_steam = codecs.getreader('utf-8')
    for line in line_steam(my_bucket.get(Range=f'bytes={0}-{(641*10)}')['Body']):
        print(line, file=open("output.txt", "a"))