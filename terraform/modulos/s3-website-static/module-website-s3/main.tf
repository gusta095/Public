resource "aws_s3_bucket" "website-s3" {
  bucket = var.bucket-name
  acl    = "public-read"

  versioning {
    enabled = true
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  policy = <<EOT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.bucket-name}/*"
            ]
        }
    ]
}
EOT

  tags = {
    Name = "website-s3"
  }
}

