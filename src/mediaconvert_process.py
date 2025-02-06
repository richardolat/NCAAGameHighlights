import boto3
import config

def convert_video():
    client = boto3.client("mediaconvert", aws_access_key_id=config.AWS_ACCESS_KEY_ID, aws_secret_access_key=config.AWS_SECRET_ACCESS_KEY, endpoint_url=config.MEDIACONVERT_ENDPOINT)

    job_settings = {
        "Role": config.MEDIACONVERT_ROLE_ARN,
        "Settings": {
            "Inputs": [{"FileInput": f"s3://{config.S3_BUCKET_NAME}/videos/nba_game_8133.mp4"}],
            "OutputGroups": [{"Outputs": [{"ContainerSettings": {"Container": "MP4"}}]}]
        }
    }

    response = client.create_job(**job_settings)
    print("MediaConvert job submitted:", response["Job"]["Id"])

if __name__ == "__main__":
    convert_video()

