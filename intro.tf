provider "aws" {

  access_key = "YOUR KEY"

  secret_key = "YOUR KEY"

  region     = "eu-north-1"
}

# Create a bucket
resource "aws_s3_bucket" "web" {

  bucket = "s3-terraform-bucket-devlabdan"

  acl    = "private"   # or can be "public-read"

  tags = {

    Name        = "Sessionsaver"

    Environment = "Dev"

  }

}

resource "aws_s3_bucket_object" "object" {

  bucket = aws_s3_bucket.devlabdan.id

  key    = "telegram-logger.session"

  acl    = "private"  # or can be "public-read"

  source = "telegram-logger.session"

  etag = filemd5("telegram-logger.session")

}