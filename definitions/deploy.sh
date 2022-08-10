#!/bin/bash

if [[ "${BRANCH_NAME}" != "main" ]]; then
  export ENV=dev
else
  export ENV=prod
fi

echo "{\"projectId\": \"${PROJECT_ID}\", \"location\": \"US\"}" > .df-credentials.json
cp "dataform.json" dataform.json
echo "copied dataform.json"

dataform install

dataform run 
