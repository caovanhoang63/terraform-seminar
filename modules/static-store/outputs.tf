output "s3_dns_name" {
  value = aws_s3_bucket.static.bucket_domain_name
}