#!/bin/bash
LOCAL_TAG='rearc-quest'

# =========== Deploy cloudformation stack ====================
# echo "deleting old stack..."
# aws cloudformation delete-stack --stack-name rearc-test-app
# aws cloudformation wait stack-delete-complete --stack-name rearc-test-app
# echo "delete complete."
# echo "creating new stack..."
# aws cloudformation create-stack \
#        --stack-name rearc-test-app \
#        --template-body file://cloudformation/ecs.yaml \
#        --parameters \
#                ParameterKey=KeyName,ParameterValue='llewis-keypair' \
#                ParameterKey=VpcId,ParameterValue='vpc-0299a9f57a34692af' \
#                ParameterKey=SubnetId,ParameterValue=subnet-086918a09e413a7bb\\,subnet-01927597a42ef647d \
#       --capabilities CAPABILITY_IAM

# =========== Build Docker image ====================
# docker build -t $LOCAL_TAG .
# docker run -p3000:3000 -it $LOCAL_TAG

# Push image to ECR
 #ECR_AUTH_ENDPOINT="760219392158.dkr.ecr.us-east-1.amazonaws.com"
# ECR_REPO="$ECR_AUTH_ENDPOINT/rearc-test-app-ecrrepo-jfgvzsmgc80k"
# aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_AUTH_ENDPOINT

# docker tag "$LOCAL_TAG:latest" "$ECR_REPO:latest" 
# docker push "$ECR_REPO:latest"

aws cloudformation update-stack \
       --stack-name rearc-test-app \
       --template-body file://cloudformation/ecs.yaml \
       --parameters \
               ParameterKey=KeyName,ParameterValue='llewis-keypair' \
               ParameterKey=VpcId,ParameterValue='vpc-0299a9f57a34692af' \
               ParameterKey=SubnetId,ParameterValue=subnet-086918a09e413a7bb\\,subnet-01927597a42ef647d \
       --capabilities CAPABILITY_IAM