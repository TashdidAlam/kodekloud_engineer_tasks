# Question
The Nautilus DevOps team is working to deploy some tools in Kubernetes cluster. Some of the tools are licence based so that licence information needs to be stored securely within Kubernetes cluster. Therefore, the team wants to utilize Kubernetes secrets to store those secrets. Below you can find more details about the requirements:

We already have a secret key file official.txt under /opt location on jump host. Create a generic secret named official, it should contain the password/license-number present in official.txt file.

Also create a pod named secret-datacenter.

Configure pod's spec as container name should be secret-container-datacenter, image should be fedora with latest tag (remember to mention the tag with image). Use sleep command for container so that it remains in running state. Consume the created secret and mount it under /opt/cluster within the container.

To verify you can exec into the container secret-container-datacenter, to check the secret key under the mounted path /opt/cluster. Before hitting the Check button please make sure pod/pods are in running state, also validation can take some time to complete so keep patience.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

---

## Step-by-Step Solution

**Step 1: Create the Secret**

- Use kubectl to create a generic secret from the file `/opt/official.txt`:

```bash
kubectl create secret generic official --from-file=/opt/official.txt
```
> *Creates a secret named `official` containing the contents of `official.txt` as a key. This securely stores the license/password in Kubernetes.*

- Check the secret:

```bash
kubectl get secrets
kubectl describe secret official
```
> *Verifies that the secret was created and contains the expected data.*

---

**Step 2: Create the Pod YAML**

- Use a text editor to create the pod manifest file:

```bash
vi secret-datacenter.yaml
```
> *Opens the file `secret-datacenter.yaml` for editing. Paste the following manifest and save the file:*

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: secret-datacenter
spec:
  containers:
  - name: secret-container-datacenter
    image: fedora:latest
    command: ["/bin/sh", "-c", "sleep 3600"]
    volumeMounts:
    - name: secret-volume
      mountPath: /opt/cluster
  volumes:
  - name: secret-volume
    secret:
      secretName: official
```
---

**Step 3: Apply the Pod**

- Use kubectl to apply the pod manifest:

```bash
kubectl apply -f secret-datacenter.yaml
```
> *Creates the pod and mounts the secret at `/opt/cluster` inside the container.*

- Check pod status:

```bash
kubectl get pods
```
> *Wait until the pod shows Running before proceeding.*

---

**Step 4: Verify Secret inside Pod**

- Exec into the running container to check the secret file:

```bash
kubectl exec -it secret-datacenter -- /bin/sh
```
> *Opens a shell inside the container for verification.*

- Inside the pod, check:

```bash
ls -l /opt/cluster
cat /opt/cluster/official.txt
```
> *Verifies that the license/password is present inside `official.txt` at the mounted path.*