import requests
import json
import boto3
import config

# Secure NBA API Call
API_URL = "https://api-nba-v1.p.rapidapi.com/players/statistics"

def fetch_nba_statistics():
    headers = {
        "x-rapidapi-key": config.RAPIDAPI_KEY,
        "x-rapidapi-host": "api-nba-v1.p.rapidapi.com"
    }

    params = {"game": "8133"}  # Game ID

    response = requests.get(API_URL, headers=headers, params=params)

    if response.status_code == 200:
        data = response.json()

        # Save securely to encrypted S3 bucket
        s3 = boto3.client("s3", aws_access_key_id=config.AWS_ACCESS_KEY_ID, aws_secret_access_key=config.AWS_SECRET_ACCESS_KEY)

        s3.put_object(
            Bucket=config.S3_BUCKET_NAME,
            Key="nba_game_8133_stats.json",
            Body=json.dumps(data),
            ContentType="application/json",
            ServerSideEncryption="AES256"  # Encrypted storage
        )

        print("NBA statistics saved securely to S3 bucket.")
    else:
        print(f"Failed to fetch NBA statistics. Status Code: {response.status_code}")

if __name__ == "__main__":
    fetch_nba_statistics()
