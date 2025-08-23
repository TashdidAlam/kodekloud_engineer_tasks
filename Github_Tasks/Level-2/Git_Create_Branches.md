# Question
Nautilus developers are actively working on one of the project repositories, `/usr/src/kodekloudrepos/apps`. Recently, they decided to implement some new features in the application, and they want to maintain those new changes in a separate branch. Below are the requirements shared with the DevOps team:

**On Storage server in Stratos DC, create a new branch `xfusioncorp_apps` from the `master` branch in `/usr/src/kodekloudrepos/apps` git repo.**
**Do not make any changes in the code.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH to the Storage Server and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh natasha@ststor01
  sudo su -
  ```
  > *Establishes a secure shell session to the Storage Server as user natasha, then switches to root for administrative access.*

**Step 2: Navigate to the project repository directory**
- Change to the directory containing the git repository.
  ```
  cd /usr/src/kodekloudrepos/apps
  ```
  > *Ensures you are in the correct location before running git commands.*

**Step 3: Check existing branches before creating a new branch**
- List all branches in the repository.
  ```
  git branch
  ```
  > *Displays all existing branches to confirm the current state before creating a new branch.*

**Step 4: Create a new branch from master**
- Use git to create and switch to the new branch.
  ```
  git checkout -b xfusioncorp_apps master
  ```
  > *Creates a new branch named `xfusioncorp_apps` based on the latest commit from the `master` branch and switches to it. This allows development of new features without affecting the main codebase.*

**Step 5: Check branches after creating the new branch**
- List all branches again to verify the new branch was created and is active.
  ```
  git branch
  ```
  > *Confirms that the new branch `xfusioncorp_apps` exists and is currently checked out.*

**Step 6: Complete the task**
- Click on confirm to complete the task
