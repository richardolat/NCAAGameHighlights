resource "aws_ecs_cluster" "highlight_cluster" {
  name = "highlight-cluster"
}

resource "aws_ecs_task_definition" "highlight_task" {
  family                   = "highlight-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"

  execution_role_arn = aws_iam_role.highlight_processor_role.arn
  container_definitions = file("${path.module}/container_definitions.tpl")
}
