output "s3_bucket_name" {
  value = aws_s3_bucket.highlight_bucket.id
}

output "ecr_repository_url" {
  value = aws_ecr_repository.highlight_pipeline.repository_url
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.highlight_cluster.id
}

output "iam_role_arn" {
  value = aws_iam_role.highlight_processor_role.arn
}
