# Question
This morning the Nautilus DevOps team rolled out a new release for one of the applications. Recently one of the customers logged a complaint which seems to be about a bug related to the recent release. Therefore, the team wants to rollback the recent release.

**There is a deployment named `nginx-deployment`; roll it back to the previous revision.**

**Note: The `kubectl` utility on `jump_host` has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

You can check the deployments
```
kubectl get deploy
```
```
kubectl get pods
```
Run the below command to revert to an earlier release
```
kubectl rollout undo deployment  nginx-deployment
```

Validate the task by running the below command

```
kubectl rollout status deployment  nginx-deployment
```
Click on confirm to complete the task
