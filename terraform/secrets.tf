resource "aws_secretsmanager_secret" "rapidapi_key" {
  name = "/myproject/rapidapi_key"
}

resource "aws_secretsmanager_secret_version" "rapidapi_key_version" {
  secret_id     = aws_secretsmanager_secret.rapidapi_key.id
  secret_string = "your_actual_api_key"
}
