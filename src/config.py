import os
import boto3
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Retrieve secrets securely from AWS Secrets Manager
def get_secret(secret_name):
    client = boto3.client("secretsmanager", region_name="us-east-1")
    secret = client.get_secret_value(SecretId=secret_name)
    return secret["SecretString"]

# API Keys & AWS Credentials (Do NOT Hardcode)
RAPIDAPI_KEY = os.getenv("RAPIDAPI_KEY") or get_secret("my-api-key")
AWS_ACCESS_KEY_ID = os.getenv("AWS_ACCESS_KEY_ID")
AWS_SECRET_ACCESS_KEY = os.getenv("AWS_SECRET_ACCESS_KEY")

# AWS S3 & MediaConvert
S3_BUCKET_NAME = os.getenv("S3_BUCKET_NAME")
MEDIACONVERT_ENDPOINT = os.getenv("MEDIACONVERT_ENDPOINT")
MEDIACONVERT_ROLE_ARN = f"arn:aws:iam::{os.getenv('AWS_ACCOUNT_ID')}:role/HighlightProcessorRole"
