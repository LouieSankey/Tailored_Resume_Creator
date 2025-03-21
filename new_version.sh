#!/bin/bash

# Check if correct number of arguments provided
if [ "$#" -ne 2 ]; then
    echo "Usage: ./new_version.sh <company_name> <version_type>"
    echo "Version types: fullstack, frontend, mobile"
    echo "Example: ./new_version.sh google fullstack"
    exit 1
fi

COMPANY_NAME=$1
VERSION_TYPE=$2

# Validate version type
if [[ ! "$VERSION_TYPE" =~ ^(fullstack|frontend|mobile)$ ]]; then
    echo "Error: Version type must be one of: fullstack, frontend, mobile"
    exit 1
fi

# Check if template exists
TEMPLATE="versions/main/${VERSION_TYPE}.md"
if [ ! -f "$TEMPLATE" ]; then
    echo "Error: Template file $TEMPLATE not found"
    exit 1
fi

# Create company directory if it doesn't exist
COMPANY_DIR="versions/jobs/${COMPANY_NAME}"
mkdir -p "$COMPANY_DIR"

# Create new version
NEW_FILE="${COMPANY_DIR}/${VERSION_TYPE}.md"
cp "$TEMPLATE" "$NEW_FILE"

# Create job description file
JOB_DESC_FILE="${COMPANY_DIR}/job_description.md"
touch "$JOB_DESC_FILE"

echo "Created new resume version: $NEW_FILE"
echo "Created job description file: $JOB_DESC_FILE"
echo "You can now:"
echo "1. Edit $NEW_FILE to tailor it for $COMPANY_NAME"
echo "2. Paste the job description into $JOB_DESC_FILE" 