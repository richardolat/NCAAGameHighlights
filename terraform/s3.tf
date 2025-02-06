# ✅ S3 Bucket Resource (without versioning block)
resource "aws_s3_bucket" "highlight_bucket" {
  bucket = "sports-nba-richards-highlights"

  lifecycle {
    prevent_destroy = true
  }
}

# ✅ Versioning Configured Separately
resource "aws_s3_bucket_versioning" "highlight_bucket_versioning" {
  bucket = aws_s3_bucket.highlight_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# ✅ Server-Side Encryption Configuration
resource "aws_s3_bucket_server_side_encryption_configuration" "highlight_bucket_encryption" {
  bucket = aws_s3_bucket.highlight_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


