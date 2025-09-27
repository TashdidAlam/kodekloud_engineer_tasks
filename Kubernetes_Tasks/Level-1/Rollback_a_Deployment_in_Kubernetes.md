# Question
This morning the Nautilus DevOps team rolled out a new release for one of the applications. Recently one of the customers logged a complaint which seems to be about a bug related to the recent release. Therefore, the team wants to rollback the recent release.

**There is a deployment named `nginx-deployment`; roll it back to the previous revision.**

**Note: The `kubectl` utility on `jump_host` has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

---

## Step-by-Step Solution

**Step 1: Check the current deployments and pods**

- List all deployments in the cluster:

```bash
kubectl get deploy
```
> *Shows all deployments in the current namespace to confirm the existence of `nginx-deployment`.*

- List all pods to see the current state of the application:

```bash
kubectl get pods
```
> *Displays all pods in the current namespace, allowing you to review their status before rollback.*

---

**Step 2: Rollback the deployment to the previous revision**

- Use the following command to revert the deployment to its previous state:

```bash
kubectl rollout undo deployment nginx-deployment
```
> *Rolls back the `nginx-deployment` to the previous revision, undoing the most recent changes.*

---

**Step 3: Validate the rollback status**

- Monitor the status of the deployment to ensure the rollback is complete and all pods are running:

```bash
kubectl rollout status deployment nginx-deployment
```
> *Checks the progress and completion of the rollback, confirming that the deployment is stable and pods are up.*
