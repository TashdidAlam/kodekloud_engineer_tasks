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

**Create the manifest file with name volume-share-datacenter.yml**
```
vi volume-share-datacenter.yml
```
Add this inside the yml file
```
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
Now create the pod
```bash
kubectl apply -f volume-share-datacenter.yml
```
Now exect into the container 1 and run the commands
```bash
kubectl exec -it volume-share-datacenter -c volume-container-datacenter-1 -- /bin/sh
```
Inside Container
```bash
echo "Hello from container 1" > /tmp/ecommerce/ecommerce.txt
exit
```
Now test the file existence
```bash
kubectl exec -it volume-share-datacenter -c volume-container-datacenter-2 -- /bin/sh
```
Run this command
```bash
cat /tmp/apps/ecommerce.txt
exit
```
If the file gives output then Click on confirm to complete the task