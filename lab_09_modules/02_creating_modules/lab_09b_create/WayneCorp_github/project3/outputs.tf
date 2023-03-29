output "s3_id" {
  description = "ID of the s3 bucket"
  value       = module.my_s3_bucket_from_module.s3_id
}

output "s3_arn" {
  description = "ARN of the s3 bucket"
  value       = module.my_s3_bucket_from_module.s3_arn
}

output "s3_region" {
  description = "AWS region this bucket resides in"
  value       = module.my_s3_bucket_from_module.s3_region
}

output "s3_bucket_domain_name" {
  description = "Bucket domain name"
  value       = module.my_s3_bucket_from_module.s3_bucket_domain_name
}

output "s3_tags" {
  description = "Map of tags assigned to the resource"
  value       = module.my_s3_bucket_from_module.s3_tags
}