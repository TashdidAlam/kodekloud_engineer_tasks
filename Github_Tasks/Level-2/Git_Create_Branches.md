# Question
Nautilus developers are actively working on one of the project repositories, `/usr/src/kodekloudrepos/apps`. Recently, they decided to implement some new features in the application, and they want to maintain those new changes in a separate branch. Below are the requirements that have been shared with the DevOps team:

**On Storage server in Stratos DC create a new branch `xfusioncorp_apps` from `master` branch in `/usr/src/kodekloudrepos/apps` git repo.**

**Please do not try to make any changes in the code.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

SSH to storage server and switch to root

```
ssh natasha@ststor01
```
```
sudo su -
```
Go to the directory described in the question
```
cd /usr/src/kodekloudrepos/apps
```

Now create the branch
```
git checkout -b xfusioncorp_apps master
```

Click on confirm to complete the task
