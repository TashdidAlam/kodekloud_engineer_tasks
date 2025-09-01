# Question
The Nautilus application development team has been working on a project repository `/opt/demo.git`. This repo is cloned at `/usr/src/kodekloudrepos` on the storage server in Stratos DC. They recently shared the following requirements with the DevOps team:

One of the developers is working on the feature branch and their work is still in progress. However, there are some changes which have been pushed into the master branch. The developer now wants to rebase the feature branch with the master branch without losing any data from the feature branch, and without adding any merge commit by simply merging the master branch into the feature branch. Accomplish this task as per requirements mentioned.

**Also remember to push your changes once done.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH into the Storage Server and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh natasha@ststor01
  sudo su -
  ```
  > *Establishes a secure shell session to the storage server as user natasha, then switches to root for administrative access.*

**Step 2: Navigate to the demo repository**
- Change to the directory containing the git repository.
  ```
  cd /usr/src/kodekloudrepos/demo
  ```
  > *Ensures you are in the correct location before running git commands.*

**Step 3: Make sure the repository is clean**
- Check for uncommitted changes before rebasing.
  ```
  git status
  ```
  > *If there are uncommitted changes, either commit or stash them before proceeding with the rebase to avoid data loss.*

**Step 4: Checkout the feature branch**
- Switch to the feature branch to prepare for rebasing.
  ```
  git checkout feature
  ```
  > *Ensures you are on the correct branch before rebasing.*

**Step 5: Update master branch**
- Fetch the latest changes and update the master branch.
  ```
  git fetch origin
  git checkout master
  git pull origin master
  ```
  > *Ensures the master branch is up to date before rebasing the feature branch onto it.*

**Step 6: Rebase the feature branch with master**
- Switch back to the feature branch and rebase it onto master.
  ```
  git checkout feature
  git rebase master
  ```
  > *Rebases the feature branch onto master, replaying feature branch commits on top of master without creating a merge commit.*

**Step 7: Resolve any conflicts (if any)**
- If there are conflicts, resolve them and continue the rebase.
  ```
  git status     # shows conflicted files
  # edit files to resolve conflicts
  git add <file>
  git rebase --continue
  ```
  > *Fixes any merge conflicts and continues the rebase process.*

**Step 8: Push the rebased feature branch**
- Force push the rebased feature branch to the remote repository.
  ```
  git push origin feature --force
  ```
  > *Force-pushes the rebased branch since history was rewritten during rebase.*

**Step 9: Verification**
- Check the commit history to confirm the rebase was successful.
  ```
  git log --oneline --graph --decorate --all
  ```
  > *Verifies that master commits are at the bottom and feature commits are rebased neatly on top of master, with no merge commit.*

**Step 10: Complete the task**
- Click confirm to finish the task.