# Question
One of the junior DevOps team members was working on to deploy a stack on Kubernetes cluster. Somehow the pod is not coming up and its failing with some errors. We need to fix this as soon as possible. Please look into it.

**There is a pod named `webserver` and the container under it is named as `httpd-container`. It is using image `httpd:latest`**

**There is a sidecar container as well named `sidecar-container` which is using `ubuntu:latest` image.**

**Look into the issue and fix it, make sure pod is in `running` state and you are able to access the app.**

**Note: The `kubectl` utility on `jump_host` has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>


First check the pods are running or not
```
kubectl get pods
```
Describe the pod for identifying the issue
```
kubectl describe pod webserver
```
**In my case The image name httpd:latest was written wrong as httpd:latests**

Now we are going to edit the file

```
kubectl edit pod webserver
```
Wait for  pods to get running status
```
kubectl get pods
```
If pods are all in running state then click on confirm to complete the task
