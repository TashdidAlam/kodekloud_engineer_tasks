# Question
The Nautilus application development team was working on a git repository `/usr/src/kodekloudrepos/blog` present on the Storage server in Stratos DC. One of the developers stashed some in-progress changes in this repository, but now they want to restore some of the stashed changes. Find below more details to accomplish this task:

**Look for the stashed changes under `/usr/src/kodekloudrepos/blog` git repository, and restore the stash with `stash@{1}` identifier. Further, commit and push your changes to the origin.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH into the Storage Server and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh natasha@ststor01
  sudo su -
  ```
  > *Establishes a secure shell session to the storage server as user natasha, then switches to root for administrative access.*

**Step 2: Navigate to the blog repository**
- Change to the directory containing the git repository.
  ```
  cd /usr/src/kodekloudrepos/blog
  ```
  > *Ensures you are in the correct location before running git commands.*

**Step 3: List stashes in the repository**
- View all stashed changes to identify the stash to restore.
  ```
  git stash list
  ```
  > *Displays all stashed changes. Look for `stash@{1}` in the output.*

**Step 4: Apply the specified stash**
- Restore the changes from the stash with identifier `stash@{1}`.
  ```
  git stash apply stash@{1}
  ```
  > *Applies the changes from the specified stash to your working directory. This does not remove the stash entry.*

**Step 5: Stage and commit the restored changes**
- Add all changes to the staging area and commit them.
  ```
  git add .
  git commit -m "restored stashed changes"
  ```
  > *Stages and commits the restored changes with a descriptive message.*

**Step 6: Push changes to origin**
- Push the committed changes to the remote repository.
  ```
  git push origin master
  ```
  > *Uploads the changes to the remote master branch for others to use.*

**Step 7: Verification**
- Confirm that the changes are committed and present on the remote.
  ```
  git log --oneline -1
  git log origin/master --oneline -1
  ```
  > *Verifies that the latest commit is "restored stashed changes" both locally and on the remote.*

**Step 8: Complete the task**
- Click confirm to finish the task.