# Question
We deployed a Nginx and PHP-FPM based setup on Kubernetes cluster last week and it had been working fine so far. This morning one of the team members made a change somewhere which caused some issues, and it stopped working. Please look into the issue and fix it:

**The pod name is `nginx-phpfpm` and configmap name is `nginx-config`. Figure out the issue and fix the same.**

**Once issue is fixed, copy `/home/thor/index.php` file from the `jump host` to the `nginx-container` under `nginx document root` and you should be able to access the website using Website button on top bar.**

**Note: The `kubectl` utility on `jump_host` has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Check existing running pods 

```
kubectl get pods
```

Check the shared volume path in existing config map

```
kubectl get configmap
```
```
kubectl describe configmap nginx-config
```

For my case the root was
`root /var/www/html;`

Get the configuration in the YAML file from the running pod

```
kubectl get pod nginx-phpfpm -o yaml  > /tmp/nginx.yaml
```
Edit the nginx.yaml file and change ‘/usr/share/nginx/html’ to ‘/var/www/html’ in all places.

```
vi nginx.yaml
```
After changing check if any place left not edited
```
cat /tmp/nginx.yaml  |grep /usr/share/nginx/html
```

if there is no output then all places are being replaced

Post changes the mount path run below command to replace the running pods

```
kubectl replace -f /tmp/nginx.yaml --force
```
Wait for pods to get running status
```
kubectl get pods
```
Now copy the index.php file as per the task.

```
kubectl cp  /home/thor/index.php  nginx-phpfpm:/var/www/html -c nginx-container
```

Now click on the website button or check with this command that if the website is accessible or not

```
kubectl exec -it nginx-phpfpm -c nginx-container  -- curl -I  http://localhost:8099
```

If all ok then click on confirm to complete the task