# Question
The Nautilus application development team has been working on a project repository `/opt/ecommerce.git`. This repo is cloned at `/usr/src/kodekloudrepos` on the storage server in Stratos DC. They recently shared the following requirements with the DevOps team:

There are two branches in this repository, `master` and `feature`. One of the developers is working on the `feature` branch and their work is still in progress. However, they want to merge one of the commits from the `feature` branch to the `master` branch. The message for the commit that needs to be merged into master is "Update info.txt". Accomplish this task for them, and remember to push your changes eventually.

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH into the Storage Server and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh natasha@ststor01
  sudo su -
  ```
  > *Establishes a secure shell session to the storage server as user natasha, then switches to root for administrative access.*

**Step 2: Navigate to the ecommerce repository**
- Change to the directory containing the cloned git repository.
  ```
  cd /usr/src/kodekloudrepos/ecommerce
  ```
  > *Ensures you are in the correct location before running git commands.*

**Step 3: Check branches and switch to master**
- Switch to the master branch and list all branches to confirm the feature branch exists.
  ```
  git checkout master
  git branch
  git branch -a
  ```
  > *Ensures you are on the master branch and verifies the existence of the feature branch.*

**Step 4: Identify the commit to cherry-pick**
- List commits on the feature branch and find the commit with the message "Update info.txt".
  ```
  git log feature --oneline
  ```
  > *Displays the commit history of the feature branch. Note the commit hash for the required commit.*

**Step 5: Cherry-pick the commit onto master**
- Apply the specific commit from feature branch to master using its hash.
  ```
  git cherry-pick <commit-hash>
  ```
  > *Merges only the specified commit into master without merging the entire feature branch. Replace `<commit-hash>` with the actual hash you identified.*

**Step 6: Push master to origin**
- Push the updated master branch to the remote repository.
  ```
  git push origin master
  ```
  > *Uploads the changes to the remote master branch for others to use.*

**Step 7: Verification**
- Check that the commit is now present on master.
  ```
  git log --oneline master
  ```
  > *Verifies that the "Update info.txt" commit appears on top of the master branch.*

**Step 8: Complete the task**
- Click on confirm to complete the task.