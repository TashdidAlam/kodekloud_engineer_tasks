# Question
There is an application deployed on Kubernetes cluster. Recently, the Nautilus application development team developed a new version of the application that needs to be deployed now. As per new updates some new changes need to be made in this existing setup. So update the deployment and service as per details mentioned below:

**We already have a deployment named `nginx-deployment` and service named `nginx-service`. Some changes need to be made in this deployment and service, make sure not to delete the deployment and service.**

**1.) Change the service `nodeport from 30008 to 32165`**

**2.) Change the `replicas` count from `1 to 5`**

**3.) Change the `image` from `nginx:1.19` to `nginx:latest`**

**Note: The `kubectl` utility on `jump_host` has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

First edit the nodeport in the service
```
kubectl edit service nginx-service
```

After editing the service not we edit replica count & image in the nginx-deployment

```
kubectl edit deployment nginx-deployment
# Change the `replicas` field from 1 to 5 and update the `image` field from `nginx:1.19` to `nginx:latest`, save and exit the editor.
```

Check if deployment and service are running or not
```
kubectl get service nginx-service
kubectl get deployment nginx-deployment
```
Now check if the number of replica pods are running or not
```
kubectl get pods
```
If all the pods are running then click on confirm to complete the task
