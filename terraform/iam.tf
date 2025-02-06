variable "task_execution_role_name" {
  default = "HighlightProcessorRole"
}

# IAM Role for ECS Tasks, EC2, and MediaConvert
resource "aws_iam_role" "highlight_processor_role" {
  name = var.task_execution_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = [
            "ec2.amazonaws.com",
            "ecs-tasks.amazonaws.com",
            "mediaconvert.amazonaws.com"
          ]
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach AWS Managed Policy for AWS MediaConvert
resource "aws_iam_policy_attachment" "mediaconvert_access" {
  name       = "MediaConvertAccess"
  policy_arn = "arn:aws:iam::aws:policy/AWSMediaConvertFullAccess"
  roles      = [aws_iam_role.highlight_processor_role.name]
}

# Attach AWS Managed Policy for ECS Execution
resource "aws_iam_policy_attachment" "ecs_execution_role_policy" {
  name       = "ECSExecutionRolePolicy"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  roles      = [aws_iam_role.highlight_processor_role.name]
}

# Attach AWS Managed Policy for S3 Full Access
resource "aws_iam_policy_attachment" "s3_access" {
  name       = "S3Access"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  roles      = [aws_iam_role.highlight_processor_role.name]
}

# Attach AWS Managed Policy for CloudWatch Logs
resource "aws_iam_policy_attachment" "cloudwatch_access" {
  name       = "CloudWatchLogsAccess"
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
  roles      = [aws_iam_role.highlight_processor_role.name]
}

# Attach AWS Managed Policy for Secrets Manager (Storing API Keys Securely)
resource "aws_iam_policy_attachment" "secrets_manager_access" {
  name       = "SecretsManagerAccess"
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
  roles      = [aws_iam_role.highlight_processor_role.name]
}
