# Question
The Nautilus DevOps team is working on to setup some pre-requisites for an application that will send the greetings to different users. There is a sample deployment, that needs to be tested. Below is a scenario which needs to be configured on Kubernetes cluster. Please find below more details about it.


Create a pod named print-envars-greeting.

Configure spec as, the container name should be print-env-container and use bash image.

Create three environment variables:

a. GREETING and its value should be Welcome to

b. COMPANY and its value should be DevOps

c. GROUP and its value should be Industries

Use command ["/bin/sh", "-c", 'echo "$(GREETING) $(COMPANY) $(GROUP)"'] (please use this exact command), also set its restartPolicy policy to Never to avoid crash loop back.

You can check the output using kubectl logs -f print-envars-greeting command.


Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>


## Step-by-Step Solution

**Step 1: Create the pod manifest YAML file**

- Use a text editor to create the pod definition file:

```bash
vi print-envars-greeting.yaml
```
> *Opens the file `print-envars-greeting.yaml` for editing. Paste the following manifest and save the file:*

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: print-envars-greeting
spec:
  containers:
  - name: print-env-container
    image: bash
    command: ["/bin/sh", "-c", 'echo "$(GREETING) $(COMPANY) $(GROUP)"']
    env:
    - name: GREETING
      value: "Welcome to"
    - name: COMPANY
      value: "DevOps"
    - name: GROUP
      value: "Industries"
  restartPolicy: Never
```

---

**Step 2: Create the pod using kubectl**

- Apply the manifest to create the pod:

```bash
kubectl apply -f print-envars-greeting.yaml
```
> *Creates the pod in the cluster using the configuration defined in `print-envars-greeting.yaml`.*

---

**Step 3: Check pod status**

- List all pods to confirm the pod is present and see its status:

```bash
kubectl get pods
```
> *Shows all pods in the current namespace, allowing you to verify the status of `print-envars-greeting`.*

---

**Step 4: View pod logs to verify output**

- Display the logs from the pod to check the greeting message:

```bash
kubectl logs -f print-envars-greeting
```
> *Shows the output of the command run in the container, which should display the greeting message using the environment variables.*