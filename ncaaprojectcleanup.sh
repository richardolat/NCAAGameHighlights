#!/bin/bash
echo "Cleaning up AWS resources..."
aws s3 rm s3://your_s3_bucket_name --recursive
