provider "aws" {
  profile = "gusta-terraform"
  region  = "us-east-1"
}

resource "aws_s3_bucket_object" "website-object" {
  for_each = fileset("./website/", "*")

  bucket = "website-s3-65264"
  key    = each.value
  source = "./website/${each.value}"
  etag   = filemd5("./website/${each.value}")
}