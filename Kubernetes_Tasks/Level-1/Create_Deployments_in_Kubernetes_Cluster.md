
# Problem: Create a Deployment in Kubernetes Cluster (nginx)

The Nautilus DevOps team is practicing pod and service deployment on Kubernetes. Your task is to create a deployment as per the requirements below:

**Requirements:**
- Deployment name: `nginx`
- Application: `nginx`
- Image: `nginx:latest` (must specify the tag)
- The `kubectl` utility is already configured on the jump host.

---

## Step-by-Step Solution

**Step 1: Create the deployment using kubectl**

- Use the following command to create the deployment with the required image:

```bash
kubectl create deploy nginx --image=nginx:latest
```
> *Creates a deployment named `nginx` using the `nginx:latest` image. The `--image` flag specifies the container image and tag to use for the deployment.*

---

**Step 2: Validate the deployment and pods**

- Check that the deployment was created successfully:

```bash
kubectl get deploy
```
> *Lists all deployments in the current namespace to confirm that the `nginx` deployment exists.*

- Check that the pods for the deployment are running:

```bash
kubectl get pods
```
> *Lists all pods in the current namespace to confirm that the pods created by the `nginx` deployment are running.*

---

**Summary:**
- You have created a deployment named `nginx` using the `nginx:latest` image and verified that the deployment and its pods are running in the Kubernetes cluster.