#!/bin/bash
STATUS=$(curl -o /dev/null -w "%{http_code}" "localhost:8080")

if [ $STATUS -eq 200 ]; then
  echo "SUCCESS"
  mv /home/aedorablee_gmail_com/artifact/build/libs/app.jar /home/aedorablee_gmail_com/artifact_v1/
else
  echo "FAILED, Rollback application"
  cp /home/aedorablee_gmail_com/artifact_v1/app.jar /home/aedorablee_gmail_com/artifact/build/libs/
fi
