import time
import fetch
import process_one_video
import mediaconvert_process

def run_pipeline():
    print("Fetching NBA statistics...")
    fetch.fetch_nba_statistics()
    
    time.sleep(5)  # Buffer time

    print("Processing video...")
    process_one_video.process_video()

    time.sleep(5)  # Buffer time

    print("Converting video...")
    mediaconvert_process.convert_video()

if __name__ == "__main__":
    run_pipeline()
