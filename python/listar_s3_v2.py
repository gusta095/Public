import boto3

S3 = boto3.client('s3')
RESPONSE = S3.list_buckets()
print(RESPONSE)
