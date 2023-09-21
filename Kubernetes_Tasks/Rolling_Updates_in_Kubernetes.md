# Question
We have an application running on Kubernetes cluster using nginx web server. The Nautilus application development team has pushed some of the latest changes and those changes need be deployed. The Nautilus DevOps team has created an image `nginx:1.18` with the latest changes.

**Perform a rolling update for this application and incorporate `nginx:1.18 image`. The deployment name is `nginx-deployment`**

**Make sure all pods are up and running after the update.**

**Note: The `kubectl` utility on `jump_host` has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Use this command for the deployment with the specific image

```
kubectl set image deployment/nginx-deployment nginx-container=nginx:1.18 --record
```
You can monitor the rollout status using the following command

```
kubectl rollout status deployment/nginx-deployment
```

Optionally, you can check the rollout history to verify that the update was successful

```
kubectl rollout history deployment/nginx-deployment
```
Click on confirm to complete the task
