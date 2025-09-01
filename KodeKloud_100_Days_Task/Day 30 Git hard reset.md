# Question
The Nautilus application development team was working on a git repository `/usr/src/kodekloudrepos/news` present on the Storage server in Stratos DC. This was just a test repository and one of the developers pushed a couple of changes for testing, but now they want to clean this repository along with the commit history/work tree, so they want to point back the HEAD and the branch itself to a commit with the message "add data.txt file". Find below more details:

**In `/usr/src/kodekloudrepos/news` git repository, reset the git commit history so that there are only two commits in the commit history: initial commit and add data.txt file.**
**Also make sure to push your changes.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH into the Storage Server and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh natasha@ststor01
  sudo su -
  ```
  > *Establishes a secure shell session to the storage server as user natasha, then switches to root for administrative access.*

**Step 2: Navigate to the news repository**
- Change to the directory containing the git repository.
  ```
  cd /usr/src/kodekloudrepos/news
  ```
  > *Ensures you are in the correct location before running git commands.*

**Step 3: Check the commit history**
- View the commit history to identify the commit hash for "add data.txt file".
  ```
  git log --oneline
  ```
  > *Lists all commits in the repository. Note the hash for the commit with message "add data.txt file".*

**Step 4: Reset the branch to the desired commit**
- Move HEAD and the branch pointer back to the commit with message "add data.txt file".
  ```
  git reset --hard <commit-hash>
  ```
  > *Removes all commits after the specified commit, cleaning up the history and work tree. Replace `<commit-hash>` with the actual hash you identified.*

**Step 5: Verify the commit history**
- Confirm that only the initial commit and "add data.txt file" remain.
  ```
  git log --oneline
  ```
  > *Ensures the repository now only has the two required commits.*

**Step 6: Force push to remote**
- Push the cleaned-up history to the remote repository, overwriting the remote branch.
  ```
  git push origin master --force
  ```
  > *Force-pushes the local branch to the remote, updating it to match the cleaned history.*

**Step 7: Verification**
- Check the remote log to confirm only two commits exist.
  ```
  git log origin/master --oneline
  ```
  > *Verifies that the remote repository also has only the two required commits.*

**Step 8: Complete the task**
- Click confirm to finish the task.