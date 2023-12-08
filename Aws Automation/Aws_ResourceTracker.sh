#!/bin/bash

###################

# Author : yamini
# Date   : 4/12/2023

#version : v1
#
#This script will track the resources in aws
#
#####################

#AWS S3
#AWS EC2
#AWS IAM USER
#AWS LAMBDA

set -e

OUTPUT_FILE="/root/ResourceTracker"

echo "Resource Tracking - $(date)" > "$OUTPUT_FILE"

#List of Ec2 instances
echo "list of ec2 instances" >> "$OUTPUT_FILE"

aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> "$OUTPUT_FILE"

#List of s3 buckets
echo "list of s3 buckets" >> "$OUTPUT_FILE"
aws s3 ls >> "$OUTPUT_FILE"

#List of IAM Users
echo "list of IAM User"  >> "$OUTPUT_FILE"
aws iam list-users >> "$OUTPUT_FILE"

#List lambda functions
echo "list of lambda functions" >> "$OUTPUT_FILE"
aws lambda list-functions >> "$OUTPUT_FILE"