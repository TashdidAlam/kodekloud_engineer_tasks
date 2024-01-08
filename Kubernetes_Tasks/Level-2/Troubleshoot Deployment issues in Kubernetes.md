# Question
Last week, the Nautilus DevOps team deployed a redis app on Kubernetes cluster, which was working fine so far. This morning one of the team members was making some changes in this existing setup, but he made some mistakes and the app went down. We need to fix this as soon as possible. Please take a look.

The deployment name is redis-deployment. The pods are not in running state right now, so please look into the issue and fix the same.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Describe the configuration of the deployment
```
kubectl describe deployment
kubectl describe configmap
kubectl describe pods
```
In my case there was some spelling mistake in the deployment yml file & config map

Click on confirm to complete the task
