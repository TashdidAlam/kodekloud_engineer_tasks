# Question
Last week, the Nautilus DevOps team deployed a redis app on Kubernetes cluster, which was working fine so far. This morning one of the team members was making some changes in this existing setup, but he made some mistakes and the app went down. We need to fix this as soon as possible. Please take a look.

The deployment name is redis-deployment. The pods are not in running state right now, so please look into the issue and fix the same.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>


---

## Step-by-Step Solution

**Step 1: Describe the configuration of the deployment, configmap, and pods**

- Use the following commands to inspect the current state and configuration:

```bash
kubectl describe deployment
kubectl describe configmap
kubectl describe pods
```
> *These commands help you identify issues such as incorrect image names, configmap references, or other misconfigurations that may be causing the pods to fail.*

---

**Step 2: Fix any detected issues in the deployment YAML or configmap**

- If you find a spelling mistake or incorrect value (e.g., image name or configmap name), edit the relevant YAML file and apply the fix. For example:

```bash
kubectl edit deployment
```

> *If the image is written as `redis:alpin`, change it to `redis:alpine`.*
> *If the configmap is referenced as `redis-conig`, change it to `redis-config`.*

- After editing, re-apply the corrected manifest:

```bash
kubectl apply -f <corrected-yaml-file>
```
> *This updates the deployment or configmap with the correct values, allowing the pods to start successfully.*
