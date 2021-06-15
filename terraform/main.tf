provider "aws" {
  profile = "microservices-qa"
}

resource "aws_s3_bucket" "gusta-s3" {
  bucket = "gusta-sec-846382"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  versioning {
    enabled = true
  }

  logging {
    target_bucket = "gusta-sec-846382"
    target_prefix = "log/"
  }

}

resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
  enable_key_rotation = true
}
