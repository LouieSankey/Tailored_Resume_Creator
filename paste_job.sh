#!/bin/bash

# Check if correct number of arguments provided
if [ "$#" -ne 1 ]; then
    echo "Usage: ./paste_job.sh <company_name>"
    echo "Example: ./paste_job.sh google"
    exit 1
fi

COMPANY_NAME=$1
JOB_DESC_FILE="versions/jobs/${COMPANY_NAME}/job_description.md"

# Check if company directory exists
if [ ! -d "versions/jobs/${COMPANY_NAME}" ]; then
    echo "Error: Company directory not found. Please create a version first using new_version.sh"
    exit 1
fi

# Check if job description file exists
if [ ! -f "$JOB_DESC_FILE" ]; then
    echo "Error: Job description file not found. Please create a version first using new_version.sh"
    exit 1
fi

echo "Paste the job description below. Press Ctrl+D (Unix) or Ctrl+Z (Windows) when done:"
cat > "$JOB_DESC_FILE"

echo "Job description saved to $JOB_DESC_FILE" 