# Question
We deployed a Nginx and PHP-FPM based setup on Kubernetes cluster last week and it had been working fine so far. This morning one of the team members made a change somewhere which caused some issues, and it stopped working. Please look into the issue and fix it:

**The pod name is `nginx-phpfpm` and configmap name is `nginx-config`. Figure out the issue and fix the same.**

**Once issue is fixed, copy `/home/thor/index.php` file from the `jump host` to the `nginx-container` under `nginx document root` and you should be able to access the website using Website button on top bar.**

**Note: The `kubectl` utility on `jump_host` has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

---

## Step-by-Step Solution

**Step 1: Check existing running pods**

- List all pods in the cluster to confirm the pod is present and see its status:

```bash
kubectl get pods
```
> *Shows all pods in the current namespace, allowing you to verify the status of `nginx-phpfpm`.*

---

**Step 2: Check the shared volume path in the config map**

- List all configmaps and describe the relevant one to find the document root:

```bash
kubectl get configmap
kubectl describe configmap nginx-config
```
> *Displays the configuration details for `nginx-config`, including the root path (e.g., `root /var/www/html;`).*

---

**Step 3: Get the pod configuration in YAML format**

- Export the running pod's configuration to a YAML file for editing:

```bash
kubectl get pod nginx-phpfpm -o yaml > /tmp/nginx.yaml
```
> *Saves the current configuration of `nginx-phpfpm` to `/tmp/nginx.yaml` for review and modification.*

---

**Step 4: Edit the YAML file to fix the mount path**

- Open the YAML file and change all instances of `/usr/share/nginx/html` to `/var/www/html`:

```bash
vi /tmp/nginx.yaml
```
> *Edits the pod configuration to match the correct document root as specified in the configmap.*

- After editing, check for any remaining incorrect paths:

```bash
cat /tmp/nginx.yaml | grep /usr/share/nginx/html
```
> *Ensures all instances have been replaced. If there is no output, all paths are updated.*

---

**Step 5: Replace the running pod with the updated configuration**

- Apply the updated YAML to force replace the pod:

```bash
kubectl replace -f /tmp/nginx.yaml --force
```
> *Replaces the existing pod with the corrected configuration, ensuring the mount path is fixed.*

---

**Step 6: Wait for the pod to reach running status**

- Monitor the pod status until it is running:

```bash
kubectl get pods
```
> *Confirms that the pod is up and running after the replacement.*

---

**Step 7: Copy the index.php file to the container**

- Use the following command to copy the required file from the jump host to the container's document root:

```bash
kubectl cp /home/thor/index.php nginx-phpfpm:/var/www/html -c nginx-container
```
> *Copies `index.php` into the correct location inside the container, as required by the task.*

---

**Step 8: Verify website accessibility**

- Check if the website is accessible by executing a curl command inside the container:

```bash
kubectl exec -it nginx-phpfpm -c nginx-container -- curl -I http://localhost:8099
```
> *Executes a curl request from within the container to verify that the web server is serving content on port 8099.*