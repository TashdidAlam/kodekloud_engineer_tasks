# Question
We are working on an application that will be deployed on multiple containers within a pod on Kubernetes cluster. There is a requirement to share a volume among the containers to save some temporary data. The Nautilus DevOps team is developing a similar template to replicate the scenario. Below you can find more details about it.

**Create a `pod` named `volume-share-datacenter`.**

**For the first container, use `image fedora` with `latest` tag only and remember to mention the tag i.e `fedora:latest`, container should be named as `volume-container-datacenter-1`, and run a `sleep` command for it so that it remains in running state. Volume `volume-share` should be mounted at path `/tmp/ecommerce`.**


**For the second container, use image `fedora` with the latest tag only and remember to mention the tag i.e `fedora:latest`, container should be named as `volume-container-datacenter-2`, and again run a sleep command for it so that it remains in running state. Volume `volume-share` should be mounted at path `/tmp/apps`.**

**Volume name should be `volume-share` of type `emptyDir`.**

**After creating the pod, `exec` into the first container i.e `volume-container-datacenter-1`, and just for testing create a file `ecommerce.txt` with any content under the mounted path of first container `i.e /tmp/ecommerce`.**

**The file `ecommerce.txt` should be present under the mounted path `/tmp/apps` on the second container  `volume-container-datacenter-2` as well, since they are using a shared volume.**

**Note: The `kubectl` utility on `jump_host` has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

---

## Step-by-Step Solution

**Step 1: Create the pod manifest YAML file**

- Use a text editor to create the pod definition file:

```bash
vi volume-share-datacenter.yml
```
> *Opens the file `volume-share-datacenter.yml` for editing. This file will define the pod, containers, and shared volume.*

- Add the following content to `volume-share-datacenter.yml`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: volume-share-datacenter
spec:
  containers:
  - name: volume-container-datacenter-1
    image: fedora:latest
    command: ["sleep", "infinity"]
    volumeMounts:
    - name: volume-share
      mountPath: /tmp/ecommerce
  - name: volume-container-datacenter-2
    image: fedora:latest
    command: ["sleep", "infinity"]
    volumeMounts:
    - name: volume-share
      mountPath: /tmp/apps
  volumes:
  - name: volume-share
    emptyDir: {}
```
> *Defines a pod with two containers, each mounting the same `emptyDir` volume at different paths. This allows sharing files between containers.*

---

**Step 2: Create the pod using kubectl**

- Apply the manifest to create the pod:

```bash
kubectl apply -f volume-share-datacenter.yml
```
> *Creates the pod in the cluster using the configuration defined in `volume-share-datacenter.yml`.*

---

**Step 3: Create a test file in the first container**

- Exec into the first container and create a file in the shared volume:

```bash
kubectl exec -it volume-share-datacenter -c volume-container-datacenter-1 -- /bin/sh
```
> *Opens a shell inside `volume-container-datacenter-1` to interact with the shared volume.*

- Inside the container, run:

```bash
echo "Hello from container 1" > /tmp/ecommerce/ecommerce.txt
exit
```
> *Creates a file in the shared volume. The file should be accessible from both containers.*

---

**Step 4: Verify the file exists in the second container**

- Exec into the second container and check for the file:

```bash
kubectl exec -it volume-share-datacenter -c volume-container-datacenter-2 -- /bin/sh
```
> *Opens a shell inside `volume-container-datacenter-2` to verify the shared volume.*

- Inside the container, run:

```bash
cat /tmp/apps/ecommerce.txt
exit
```
> *Displays the contents of the file created in the first container, confirming the shared volume is working.*