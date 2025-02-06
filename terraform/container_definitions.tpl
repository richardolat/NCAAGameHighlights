{
  "family": "highlight-processor-task",
  "networkMode": "awsvpc",
  "requiresCompatibilities": ["FARGATE"],
  "cpu": "1024",
  "memory": "2048",
  "executionRoleArn": "arn:aws:iam::720593956128:role/HighlightProcessorRole",
  "taskRoleArn": "arn:aws:iam::720593956128:role/HighlightProcessorTaskRole",
  "containerDefinitions": [
    {
      "name": "highlight-processor",
      "image": "720593956128.dkr.ecr.us-east-1.amazonaws.com/highlight-pipeline:latest",
      "essential": true,
      "memory": 2048,
      "cpu": 1024,
      "environment": [
        {"name": "S3_BUCKET_NAME", "value": "sports-nba-richards-highlights"}
      ],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "ecs/highlight-pipeline",
          "awslogs-region": "us-east-1",
          "awslogs-stream-prefix": "ecs"
        }
      }
    }
  ]
}
