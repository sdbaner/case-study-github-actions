# Coding Challenge: DevOps Engineer @ Solytic

## Introduction

This challenge is intended as a take-home task. The purpose of the task is to evaluate a few different aspects.

- How confident are you with DevOps?
- How confident are you with cloud environments?
- How confident are you with Docker?
- How do you approach cloud deployments?

In this task we assume that you have worked with some cloud provider before (preferably Azure) and you are
familiar with some Infrastructure-as-Code (IaC) tool (preferably Terraform). Furthermore, we will assume that you
know how to get a demo access to a cloud environment of your choice so that you can deploy some simple resources.

**We prefer that you use Azure as a cloud provider**. However, if you have good reasons, you can also choose another
cloud provider, but please explain why you did so.

The overall goal is to build a Docker container from a simple .NET application and execute it in a cloud environment.
Just follow the tasks that are listed below and you should be able to complete the task fairly easily.

Not all tasks involve coding. For some tasks you can simply write some notes on how you would approach a certain
problem. In the interview following the task we will go through your solution together and you will explain to us how
you approached the tasks below and why you chose the approach.

There are some bonus tasks listed below. Those are _optional_! You don't need to do them, but if you want to
implement them feel free to do so.

**Note**: don't forget to destroy the cloud resources again when you don't need them anymore.


## How to submit

Some of the tasks below require you to code something (e.g. using Terraform), other tasks require you to write some
short text. When you're done, please generate a ZIP archive containing the code and a text document that contains

- a short explanation of how you approached the problem and
- the answers to the tasks below.

Send the archive over to: geraldine.schroeder@solytic.com and mario.santos@solytic.com.

The task has no time limit, but please let us know if you take more than a week to complete it. Please don't spend
too much time on it.

If you encounter any blockers feel free to ask for guidance or write a note why you couldn't complete the task.


## Part 1: Familiarize yourself with the application

First, your task is to familiarize yourself with the application that we want to deploy. The software is written in 
C# using ASP.NET. The solution file is `Solytic.CodingChallenge.sln` and the sources are located in the
`Solytic.CodingChallenge.WebApplication/` directory. Have a look at the code and try to find out what it does.

In case you are not familiar with C#/ASP.NET: when the Program.cs is executed the app will spin up a webserver that
accepts requests on the `/api/test` endpoint.

The application directory contains a `Dockerfile` that builds the sample project into a container.

### Tasks

1. Build the Docker image from the sources
2. Run the Docker image that you built locally
3. Connect to the `/api/test` endpoint and check that the output is `It works!`


## Part 2: Deploy the app in the cloud

In this part we as you to deploy this application in the cloud. We want to check how familiar you are with cloud
environments and see whether you are able to work with Infrastructure-as-Code tools like Terraform.

Your task is to setup a small sample infrastructure so that you can host the application.

### Tasks

1. Deploy the infrastructure that you need through code (preferably Terraform)
2. Build the Docker image of the application and execute it in the cloud
3. Connect to the application through the internet and check whether the `/api/test` endpoint returns `It works!`
   (like in Part 1)

### Bonus Tasks

1. Develop a CI/CD pipeline that build and deploys the infrastructure and/or the app (e.g. using GitHub Actions or
   Azure DevOps pipelines)
2. Use Kubernetes to host the application


## Part 3: Monitor the Application and the Infrastructure

The questions in this part are more open and don't require any coding. Assume that we run two applications.

1. The first application is a simple web application that accesses some database (e.g. Azure SQL Server) and offers an
API with many endpoints (e.g. CRUD operations) that serves data either through a RESTful or a GraphQL API.
2. The second application does not host an API, but consumes events from some event bus (e.g. Kafka or EventHubs) and
emits events onto another event bus.

We would like to find out how you would monitor such applications.

### Tasks

1. For each application, which metrics would you track?
2. Given the cloud that you chose to deploy the app: which tools would you use to monitor the app?
3. Similarly, which tools would you use to alert about a potential performance degradation?
4. How would you monitor the infrastructure that you deployed in Part 2?

### Bonus Tasks

1. Implement some basic monitoring in your infrastructure (adjust the app if needed, deploy tools that you would need)
