# Question
The Nautilus application development team has been working on a project repository `/opt/blog.git`. This repo is cloned at `/usr/src/kodekloudrepos` on the storage server in Stratos DC. They recently shared the following requirements with the DevOps team: Create a new branch `devops` in `/usr/src/kodekloudrepos/blog` repo from `master` and copy the `/tmp/index.html` file (present on storage server itself) into the repo. Further, add/commit this file in the new branch and merge back that branch into `master` branch. Finally, push the changes to the origin for both branches.

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH to the storage server and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh natasha@ststor01
  sudo su -
  ```
  > *Establishes a secure shell session to the storage server as user natasha, then switches to root for administrative access.*

**Step 2: Move into the blog repository**
- Change to the directory containing the cloned git repository.
  ```
  cd /usr/src/kodekloudrepos/blog
  ```
  > *Ensures you are in the correct location before running git commands.*

**Step 3: Ensure you’re on the master branch**
- Switch to the master branch to start from the main codebase.
  ```
  git checkout master
  ```
  > *Makes sure you are working from the latest master branch before creating a new branch.*

**Step 4: Create and switch to the devops branch**
- Create a new branch and switch to it.
  ```
  git checkout -b devops
  ```
  > *Creates a new branch named `devops` from master and switches to it for isolated changes.*

**Step 5: Copy the index.html file into the repo**
- Copy the required file from `/tmp` to the repository directory.
  ```
  cp /tmp/index.html .
  ```
  > *Adds the requested file to the repository for tracking and version control.*

**Step 6: Stage and commit the file**
- Add the file to git and commit the change.
  ```
  git add index.html
  git commit -m "Added index.html file as requested"
  ```
  > *Stages and commits the new file to the devops branch with a descriptive message.*

**Step 7: Push the devops branch to origin**
- Push the new branch and its changes to the remote repository.
  ```
  git push origin devops
  ```
  > *Uploads the devops branch and its commits to the remote origin for collaboration.*

**Step 8: Switch back to master branch**
- Return to the master branch to prepare for merging.
  ```
  git checkout master
  ```
  > *Ensures you are on master before merging changes from devops.*

**Step 9: Merge devops into master**
- Merge the changes from devops branch into master.
  ```
  git merge devops
  ```
  > *Integrates the changes from devops into the main codebase.*

**Step 10: Push master to origin**
- Push the updated master branch to the remote repository.
  ```
  git push origin master
  ```
  > *Uploads the merged changes to the remote master branch for others to use.*

**Step 11: Verification**
- Check branches and confirm the file exists in master.
  ```
  git branch -a
  ls | grep index.html
  ```
  > *Verifies both branches exist and the file is present in master.*

**Step 12: Complete the task**
- Click on confirm to complete the task.
