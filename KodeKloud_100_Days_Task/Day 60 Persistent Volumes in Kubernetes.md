# Question
The Nautilus DevOps team is working on a Kubernetes template to deploy a web application on the cluster. There are some requirements to create/use persistent volumes to store the application code, and the template needs to be designed accordingly. Please find more details below:

Create a PersistentVolume named as pv-datacenter. Configure the spec as storage class should be manual, set capacity to 3Gi, set access mode to ReadWriteOnce, volume type should be hostPath and set path to /mnt/dba (this directory is already created, you might not be able to access it directly, so you need not to worry about it).

Create a PersistentVolumeClaim named as pvc-datacenter. Configure the spec as storage class should be manual, request 1Gi of the storage, set access mode to ReadWriteOnce.

Create a pod named as pod-datacenter, mount the persistent volume you created with claim name pvc-datacenter at document root of the web server, the container within the pod should be named as container-datacenter using image httpd with latest tag only (remember to mention the tag i.e httpd:latest).

Create a node port type service named web-datacenter using node port 30008 to expose the web server running within the pod.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

---

## Step-by-Step Solution

**Step 1: Save the manifest YAML file**

- Use a text editor to create the manifest file:

```bash
vi datacenter-setup.yaml
```
> *Opens the file `datacenter-setup.yaml` for editing. Paste the full YAML manifest below and save the file:*

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-datacenter
spec:
  storageClassName: manual
  capacity:
    storage: 3Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /mnt/dba
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-datacenter
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
---
apiVersion: v1
kind: Pod
metadata:
  name: pod-datacenter
  labels:
    app: datacenter-app   # Label for service selector
spec:
  containers:
  - name: container-datacenter
    image: httpd:latest
    volumeMounts:
    - mountPath: /usr/local/apache2/htdocs
      name: datacenter-storage
  volumes:
  - name: datacenter-storage
    persistentVolumeClaim:
      claimName: pvc-datacenter
---
apiVersion: v1
kind: Service
metadata:
  name: web-datacenter
spec:
  type: NodePort
  selector:
    app: datacenter-app   # Matches Pod label
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30008
```
---

**Step 2: Apply the manifest to create all resources**

- Use kubectl to apply the manifest and create the persistent volume, claim, pod, and service:

```bash
kubectl apply -f datacenter-setup.yaml
```
> *Creates all resources defined in the manifest: PersistentVolume, PersistentVolumeClaim, Pod, and Service.*

---

**Step 3: Verify resources are created and running**

- Check the status of each resource to ensure they are created and bound/running:

```bash
kubectl get pv
kubectl get pvc
kubectl get pods
kubectl get svc
```
> *Verifies that the persistent volume and claim are bound, the pod is running, and the service is available.*

---

**Step 4: Access the web server**

- Open the web server in your browser or use curl to test the NodePort service:

```bash
curl http://<NodeIP>:30008
```
> *Accesses the web server exposed by the NodePort service. Replace `<NodeIP>` with the actual node IP address. Alternatively, use the webapp button if available in your environment.*