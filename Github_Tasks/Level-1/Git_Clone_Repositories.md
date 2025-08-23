# Question
DevOps team created a new Git repository last week; however, as of now no team is using it. The Nautilus application development team recently asked for a copy of that repo on the Storage server in Stratos DC. Please clone the repo as per details shared below:

**The repo that needs to be cloned is `/opt/ecommerce.git`**
**Clone this git repository under `/usr/src/kodekloudrepos` directory. Do not make any changes in the repo.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: Log in to the Storage Server and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh natasha@ststor01
  sudo su
  ```
  > *Establishes a secure shell session to the Storage Server as user natasha, then switches to root for administrative access.*

**Step 2: Navigate to the target directory for cloning**
- Change to the directory where the repository should be cloned.
  ```
  cd /usr/src/kodekloudrepos
  ```
  > *Ensures you are in the correct location before cloning the repository.*

**Step 3: Clone the Git repository**
- Use the git clone command to copy the repository.
  ```
  git clone /opt/ecommerce.git
  ```
  > *Clones the bare repository `/opt/ecommerce.git` into the current directory. This creates a local copy for development or review.*

**Step 4: Validate the cloned repository**
- List the contents of the cloned folder to confirm success.
  ```
  ls -la ecommerce/
  ```
  > *Displays the files and directories inside the cloned repository to verify the operation was successful.*

**Step 5: Complete the task**
- Click on confirm to complete the task