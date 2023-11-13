# Create Cronjobs in Kubernetes

## Question
There are some jobs/tasks that need to be run regularly on different schedules. Currently the Nautilus DevOps team is working on developing some scripts that will be executed on different schedules, but for the time being the team is creating some cron jobs in Kubernetes cluster with some dummy commands (which will be replaced by original scripts later). Create a cronjob as per details given below:

**Create a cronjob named `devops`.**

**Set Its schedule to something like `*/4 * * * *`, you set any schedule for now.**

**Container name should be `cron-devops`.**

**Use `nginx` image with `latest` tag only and remember to mention the tag i.e `nginx:latest`.**

**Run a dummy command echo `Welcome to xfusioncorp!`.**

**Ensure `restart policy` is `OnFailure`.**

**Note: The `kubectl` utility on `jump_host` has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Now first create a devops.yml file
```
vi devops.yml
```
Now add these codes inside the file
```
apiVersion: batch/v1
kind: CronJob
metadata:
  name: devops
spec:
  schedule: "*/4 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: cron-devops
            image: nginx:latest
            command:
            - "sh"
            - "-c"
            - "echo Welcome to xfusioncorp!"
          restartPolicy: OnFailure
```

Now create the cronjob
```
kubectl apply -f devops.yml
```

We can check the cronjob with this command
```
kubectl get cronjobs
```
Click on confirm to complete the task