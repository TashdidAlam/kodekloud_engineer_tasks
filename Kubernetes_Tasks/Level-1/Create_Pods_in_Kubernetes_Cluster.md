# Question
The Nautilus DevOps team is practicing pod and service deployment on Kubernetes. Your task is to create a pod as per the requirements below:

**Requirements:**
- Pod name: `pod-httpd`
- Image: `httpd:latest` (must specify the tag)
- Container name: `httpd-container`
- Label: `app: httpd_app`
- The `kubectl` utility is already configured on the jump host.

---

## Step-by-Step Solution

**Step 1: Verify kubectl configuration and cluster connectivity**

- Check that `kubectl` is configured and can communicate with the cluster:

```bash
kubectl get namespace
```
> *Lists all namespaces in the cluster to confirm connectivity.*

```bash
kubectl get pods
```
> *Lists all pods in the current namespace to confirm kubectl is working.*

---

**Step 2: Create the pod manifest YAML file**

- Use a text editor to create the pod definition file:

```bash
vi /tmp/pod.yml
```
> *Opens the file `/tmp/pod.yml` for editing. This file will define the pod's configuration.*

- Add the following content to `/tmp/pod.yml`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-httpd
  labels:
    app: httpd_app
spec:
  containers:
  - name: httpd-container
    image: httpd:latest
```
> *Defines a pod named `pod-httpd` with the required label and container configuration. The image is explicitly set to `httpd:latest`.*

---

**Step 3: Create the pod using kubectl**

- Apply the manifest to create the pod:

```bash
kubectl create -f /tmp/pod.yml
```
> *Creates the pod in the cluster using the configuration defined in `/tmp/pod.yml`.*

---

**Step 4: Verify the pod is running**

- Check the status of the pod:

```bash
kubectl get pods -o wide
```
> *Lists all pods with detailed information to confirm that `pod-httpd` is running.*

---

**Summary:**
- You have created a pod named `pod-httpd` using the `httpd:latest` image, with the required label and container name, and verified it is running in the Kubernetes cluster.
