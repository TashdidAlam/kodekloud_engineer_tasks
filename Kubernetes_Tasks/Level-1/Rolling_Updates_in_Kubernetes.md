# Question
We have an application running on Kubernetes cluster using nginx web server. The Nautilus application development team has pushed some of the latest changes and those changes need be deployed. The Nautilus DevOps team has created an image `nginx:1.18` with the latest changes.

**Perform a rolling update for this application and incorporate `nginx:1.18 image`. The deployment name is `nginx-deployment`**

**Make sure all pods are up and running after the update.**

**Note: The `kubectl` utility on `jump_host` has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

---

## Step-by-Step Solution

**Step 1: Update the deployment with the new image**

- Use the following command to perform a rolling update and set the new image for the deployment:

```bash
kubectl set image deployment/nginx-deployment nginx-container=nginx:1.18
```
> *Updates the `nginx-deployment` to use the new image `nginx:1.18` for the container named `nginx-container`. The `--record` flag is deprecated and no longer needed.*

---

**Step 2: Monitor the rollout status**

- Check the status of the rollout to ensure all pods are updated and running:

```bash
kubectl rollout status deployment/nginx-deployment
```
> *Monitors the progress of the rolling update and confirms when all pods are successfully updated and running.*

---

**Step 3: (Optional) Check the rollout history**

- View the rollout history to verify that the update was recorded:

```bash
kubectl rollout history deployment/nginx-deployment
```
> *Displays the history of rollouts for the deployment, allowing you to confirm that the update to `nginx:1.18` was applied.*

---

**Summary:**
- You have performed a rolling update for the `nginx-deployment` to use the new image `nginx:1.18`, monitored the rollout status, and optionally checked the rollout history. All pods should be up and running with the updated image.
