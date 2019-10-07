#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

sudo yum install -y git
# git clone e2e tests
# execute e2e tests
# send logs and report through sns service (/var/log/user-data.log)
# if tests are succesful => trigger lambda to tag docker images and upload dem images to docker hub
## aws lambda invoke —function-name ReleaseVersionUpdateFunction —invocation-type Event —payload "[JSON string here]"

aws ec2 terminate-instances --instance-ids `curl http://169.254.169.254/latest/meta-data/instance-id` --region 'us-east-2'