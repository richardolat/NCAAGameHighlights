import boto3
import json
import requests
import config

def process_video():
    s3 = boto3.client("s3", aws_access_key_id=config.AWS_ACCESS_KEY_ID, aws_secret_access_key=config.AWS_SECRET_ACCESS_KEY)

    obj = s3.get_object(Bucket=config.S3_BUCKET_NAME, Key="nba_game_8133_stats.json")
    data = json.loads(obj["Body"].read())

    if data and "video" in data.get("response", [{}])[0]:
        video_url = data["response"][0]["video"]["url"]
        video_data = requests.get(video_url).content
        
        s3.put_object(
            Bucket=config.S3_BUCKET_NAME,
            Key="videos/nba_game_8133.mp4",
            Body=video_data,
            ServerSideEncryption="AES256"  # Encrypt video storage
        )
        print(f"NBA Game Video saved securely in S3.")

if __name__ == "__main__":
    process_video()
