#!/bin/bash
# Copy this file with the correct value in 'XxXxX' and make that your push script
# Also chmod to make executable

DISTRIBUTION_ID='XxXxX'

aws s3 sync --acl public-read --sse --delete ./build/ s3://www.morepablo.com
aws configure set preview.cloudfront true
aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths '/*'
