# Question
The Nautilus DevOps team is planning to deploy some micro service on Kubernetes platform. The team has already set up a Kubernetes cluster and now they want to set up some namespaces, deployments etc. Based on the current requirements the team has shared the details below:

**Create a namespace named `dev` and create a POD under it; name the pod `dev-nginx-pod` and use `nginx` image with `latest tag` only and remember to mention tag i.e `nginx:latest`.**

**Note: The `kubectl` utility on `jump_host` has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Create a new namespace as per the task 

```
kubectl create namespace dev
```
Run the below command to create a pod under the same namespace
```
kubectl run dev-nginx-pod --image=nginx:latest -n dev
```
Check if the pod is running or not

```
kubectl get pods -n dev
```

Click on confirm to complete the task
