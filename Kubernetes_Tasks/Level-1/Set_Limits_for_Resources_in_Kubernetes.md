# Question
Recently some of the performance issues were observed with some applications hosted on Kubernetes cluster. The Nautilus DevOps team has observed some resources constraints, where some of the applications are running out of resources like memory, cpu etc., and some of the applications are consuming more resources than needed. Therefore, the team has decided to add some limits for resources utilization. Below you can find more details.

**Create a pod named `httpd-pod` and a container under it named as `httpd-container`, use `httpd` image with `latest` tag only and remember to mention tag `i.e httpd:latest` and set the following limits:**

**Requests: Memory: 15Mi, CPU: 100m**

**Limits: Memory: 20Mi, CPU: 100m**

**Note: The `kubectl` utility on `jump_host` has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Create a yml file named `httpd-pod.yml` 
```
vim httpd-pod.yml
```
Add these in that yml file
```
apiVersion: v1
kind: Pod
metadata:
  name: httpd-pod
spec:
  containers:
  - name: httpd-container
    image: httpd:latest
    resources:
      requests:
        memory: "15Mi"
        cpu: "100m"
      limits:
        memory: "20Mi"
        cpu: "100m"
```
Use kubectl to create the pod by applying the YAML manifest
```
kubectl apply -f httpd-pod.yml
```
To verify that the pod has been created successfully and check its resource settings, you can use the following command
```
kubectl describe pod httpd-pod
```
Click on confirm to complete the task
