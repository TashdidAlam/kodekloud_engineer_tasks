# Question
Recently some of the performance issues were observed with some applications hosted on Kubernetes cluster. The Nautilus DevOps team has observed some resources constraints, where some of the applications are running out of resources like memory, cpu etc., and some of the applications are consuming more resources than needed. Therefore, the team has decided to add some limits for resources utilization. Below you can find more details.

**Create a pod named `httpd-pod` and a container under it named as `httpd-container`, use `httpd` image with `latest` tag only and remember to mention tag `i.e httpd:latest` and set the following limits:**

**Requests: Memory: 15Mi, CPU: 100m**

**Limits: Memory: 20Mi, CPU: 100m**

**Note: The `kubectl` utility on `jump_host` has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

---

## Step-by-Step Solution

**Step 1: Create the pod manifest YAML file**

- Use a text editor to create the pod definition file:

```bash
vi httpd-pod.yml
```
> *Opens the file `httpd-pod.yml` for editing. This file will define the pod's configuration and resource limits.*

- Add the following content to `httpd-pod.yml`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: httpd-pod
spec:
  containers:
  - name: httpd-container
    image: httpd:latest
    resources:
      requests:
        memory: "15Mi"
        cpu: "100m"
      limits:
        memory: "20Mi"
        cpu: "100m"
```
> *Defines a pod named `httpd-pod` with the required container, image, and resource requests/limits. Requests specify the minimum resources guaranteed, and limits specify the maximum resources allowed.*

---

**Step 2: Create the pod using kubectl**

- Apply the manifest to create the pod:

```bash
kubectl apply -f httpd-pod.yml
```
> *Creates the pod in the cluster using the configuration defined in `httpd-pod.yml`.*

---

**Step 3: Verify the pod and its resource settings**

- Check that the pod has been created successfully and review its resource configuration:

```bash
kubectl describe pod httpd-pod
```
> *Displays detailed information about the `httpd-pod`, including its resource requests and limits. Confirm that the values match the requirements.*

---

**Summary:**
- You have created a pod named `httpd-pod` with the required resource requests and limits, and verified its configuration in the Kubernetes cluster.
