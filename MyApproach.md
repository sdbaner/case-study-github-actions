# Approach for CI CD to deploy app engine services


## Assumptions

I am assuming below are already created and exist.
- valid azure subscription
- resource group created
- azure container registry (AZR) 
- principal service with acrpush and stored under github actions secrets.
The above will be handled by separate infrastructure code outside this repository.


## Building CI CD Pipeline

This will be divided into following pipelines using github actions

- 1. Build and Deploy Docker - Build Image and push to azure registry with latest tag using terraform action.
- 2. Provision App - Provision azure app service using terraform action for the first time (Prerequisite : Image must be present in ACR). 
- 3. Deploy App - Deploy the azure app service using github action (Prerequisite : The appp service must be in running state). 


## Workflow Dependencies

- If there are any changes in Docker code, all the three pipelines should run to deploy the latest version of app.
- If any attribute changes for the app , the other two pipelines should run.
- Run the third pipeline when you want to redeploy the app service.
