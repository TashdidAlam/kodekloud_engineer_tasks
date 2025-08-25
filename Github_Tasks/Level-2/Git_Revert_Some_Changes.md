# Question
The Nautilus application development team was working on a git repository `/usr/src/kodekloudrepos/ecommerce` present on the Storage server in Stratos DC. However, they reported an issue with the recent commits being pushed to this repo. They have asked the DevOps team to revert the repo HEAD to the last commit. Below are more details about the task:

**In `/usr/src/kodekloudrepos/ecommerce` git repository, revert the latest commit (HEAD) to the previous commit (the previous commit hash should be with the initial commit message).**
**Use `revert ecommerce` message (all small letters) for the new revert commit.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH to the storage server and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh natasha@ststor01
  sudo su -
  ```
  > *Establishes a secure shell session to the storage server as user natasha, then switches to root for administrative access.*

**Step 2: Navigate to the ecommerce git repository**
- Change to the directory containing the git repository.
  ```
  cd /usr/src/kodekloudrepos/ecommerce
  ```
  > *Ensures you are in the correct location before running git commands.*

**Step 3: Revert the latest commit (HEAD)**
- Use git to revert the most recent commit.
  ```
  git revert HEAD
  ```
  > *Creates a new commit that undoes the changes made by the latest commit, without altering the commit history.*

**Step 4: Stage all changes for commit**
- Add all changes to the staging area.
  ```
  git add .
  ```
  > *Stages all modified files for the next commit.*

**Step 5: Commit the revert with the specified message**
- Commit the staged changes with the required message.
  ```
  git commit -m 'revert ecommerce'
  ```
  > *Records the revert in the repository history with the specified commit message.*

**Step 6: Validate the revert operation**
- View the commit history to confirm the revert.
  ```
  git log
  ```
  > *Displays the commit history, allowing you to verify that the revert commit was created successfully.*

**Step 7: Complete the task**
- Click on confirm to complete the task
