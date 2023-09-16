# Question
The Nautilus DevOps team has started practicing some pods and services deployment on Kubernetes platform, as they are planning to migrate most of their applications on Kubernetes. Recently one of the team members has been assigned a task to create a deployment as per details mentioned below:

**Create a deployment named `nginx` to deploy the application `nginx` using the image `nginx:latest` (remember to mention the tag as well)**

Note: The `kubectl` utility on `jump_host` has been configured to work with the kubernetes cluster.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Create the deployment using this command
```
kubectl create deploy nginx --image nginx:latest
```
Validate the task by running below commands

```
kubectl get deploy
```

```
kubectl get pods
```
Click on confirm to complete the task