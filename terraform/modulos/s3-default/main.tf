resource "aws_s3_bucket" "test-s3-gusta" {
  bucket = "test-s3-gusta"
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.test-s3-gusta.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
