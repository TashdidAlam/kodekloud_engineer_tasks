# Question
The Nautilus application development team has been working on a project repository `/opt/media.git`. This repo is cloned at 
`/usr/src/kodekloudrepos` on storage server in Stratos DC. They recently shared the following requirements with DevOps team:

**Create a new branch devops in `/usr/src/kodekloudrepos/media` repo from master and copy the `/tmp/index.html` file (present on storage server itself) into the repo. Further, `add/commit` this file in the new branch and merge back that branch into `master` branch. Finally, push the changes to the `origin` for both of the branches.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

SSH to storage server and switch to root

```
ssh natasha@ststor01
```
```
sudo su -
```

**Navigate to the Repository**:


   ```bash
   cd /usr/src/kodekloudrepos/media
   ```
**Create the New Branch and Switch to It**:

   Create a new branch (`devops`) from the `master` branch and switch to that branch:

   ```bash
   git checkout -b devops master
   ```

**Copy the `index.html` File**:


   ```bash
   cp /tmp/index.html .
   ```

**Add and Commit the `index.html` File**:

   ```bash
   git add index.html
   git commit -m "Add index.html to devops branch"
   ```

**Merge the `devops` Branch into `master`**:

   Switch back to the `master` branch and merge the changes from the `devops` branch into `master`:

   ```bash
   git checkout master
   git merge devops
   ```

**Push the Changes to the Origin for Both Branches**:
   ```bash
   git push origin master
   git push origin devops
   ```

Click on confirm to complete the task
