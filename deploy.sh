#!/bin/bash

PROFILE='personal'

# Source environment variables from a .env file (optional)
if [ -f .env ]; then
    #export CDK_DEFAULT_ACCOUNT and CDK_DEFAULT_REGION from .env file
    export $(cat .env | xargs)
fi

# CDK commands
cdk bootstrap --profile $PROFILE  # only for first time cdk deploy
cdk list --profile $PROFILE
cdk synth --profile $PROFILE
cdk deploy --profile $PROFILE