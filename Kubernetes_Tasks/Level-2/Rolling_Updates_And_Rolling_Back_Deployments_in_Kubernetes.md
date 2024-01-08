# Question
There is a production deployment planned for next week. The Nautilus DevOps team wants to test the deployment update and rollback on Dev environment first so that they can identify the risks in advance. Below you can find more details about the plan they want to execute.

Create a namespace xfusion. Create a deployment called httpd-deploy under this new namespace, It should have one container called httpd, use httpd:2.4.25 image and 6 replicas. The deployment should use RollingUpdate strategy with maxSurge=1, and maxUnavailable=2.

Next upgrade the deployment to version httpd:2.4.43 using a rolling update.

Finally, once all pods are updated undo the update and roll back to the previous/original version.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

At first get the namespace
```
 kubectl get namespace 
```
Create namespace as per the task request
```
kubectl create namespace  xfusion
```
Create yaml  file with all the parameters
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: httpd-deploy
  namespace: xfusion
spec:
  replicas: 6
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 2
  selector:
    matchLabels:
      app: httpd
  template:
    metadata:
      labels:
        app: httpd
    spec:
      containers:
        - name: httpd
          image: httpd:2.4.25
```

Run below command to create pod

```
kubectl apply  -f /tmp/httpd.yaml --namespace=xfusion
```

Perform  rolling update by running below command

```
 kubectl set image deployment httpd-deploy  httpd=httpd:2.4.43 --namespace xfusion --record=true
```

Rollback the deployment as per task
```
kubectl rollout undo deployment httpd-deploy  -n xfusion 
```
Validate rollout status
Click on confirm to complete the task
