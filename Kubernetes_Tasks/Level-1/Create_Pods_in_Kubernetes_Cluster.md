# Question
The Nautilus DevOps team has started practicing some pods and services deployment on Kubernetes platform as they are planning to migrate most of their applications on Kubernetes platform. Recently one of the team members has been assigned a task to create a pod as per details mentioned below:

**Create a pod named `pod-httpd` using `httpd` image with `latest` tag only and remember to mention the tag i.e `httpd:latest`.**

**Labels app should be set to `httpd_app`, also container should be named as `httpd-container`.**

**Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

At first check kubectl utility configure and working from jump server

```
 kubectl get namespace
```
```
kubectl get pods
```
Now create the yml file for deployment

```
vi /tmp/pod.yml
```
In pod.yml add this

```
apiVersion: v1
kind: Pod
metadata:
  name: pod-httpd
  labels:
    app: httpd_app
spec:
  containers:
  - name: httpd-container
    image: httpd:latest
```

Run below command to create pod
```
kubectl create -f /tmp/pod.yaml
```
Check is the pod running or not
```
kubectl get pods -o wide
```

Click on confirm to complete the task
