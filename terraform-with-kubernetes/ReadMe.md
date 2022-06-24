Test Task
=======

This repo containes terraform envs to setup EKS cluster + lambda that will log every json that will be posted to it to s3 bucket.

How to use
=====

This terraform requires terraform cloud to run.
Also test_essentials workspace state should be shared to test_dev workspace.
AWS Keys should be provided through variable sets in tf cloud.

to create initiall resources(eg vpc, ecr) run:
```
cd env_essentials
tf init
tf apply
```

after that you will have to populate ecr registry from dockerfile that is located in env_dev/resources/pong-service

after that you can run:
```
cd env_dev
tf init
tf apply
```
This will create eks cluster with 8 pong-service pods and 4 nodes of c5.xlarge. Also lambda and s3 bucket will be created. Every event that is sent to lambda will be logged to s3 bucket with event date as filename.

To access pong service you will have to go to nginx ingress elb and provide host header: chart-example.local