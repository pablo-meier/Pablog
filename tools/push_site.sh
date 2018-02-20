#!/bin/bash
# Copy this file with the correct value set as AMAZON_DISTRIBUTION_ID to push to S3
#

if [ -z "$AMAZON_DISTRIBUTION_ID" ];
then
    echo 'Must set $AMAZON_DISTRIBUTION_ID'
    exit 1
fi

aws s3 sync --acl public-read --sse --delete ./build/ s3://www.morepablo.com --profile=pablo
aws configure set preview.cloudfront true --profile=pablo
aws cloudfront create-invalidation --distribution-id $AMAZON_DISTRIBUTION_ID --paths '/*' --profile=pablo
