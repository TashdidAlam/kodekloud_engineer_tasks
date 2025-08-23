# Question
The Nautilus development team shared requirements with the DevOps team regarding new application development. They want to set up a Git repository for the project. Create a Git repository on the Storage server in Stratos DC as per the details below:

**a. Use yum to install the git package on the Storage Server.**
**b. Create a bare repository `/opt/media.git` (use the exact name).**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: Sign in to the Storage Server and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh natasha@ststor01
  sudo su -
  ```
  > *Establishes a secure shell session to the Storage Server as user natasha, then switches to root for administrative access.*

**Step 2: Install Git**
- Install the Git version control system using yum.
  ```
  yum install -y git
  ```
  > *Installs Git, which is required to create and manage repositories.*

**Step 3: Create a bare Git repository**
- Navigate to the target directory and initialize a bare repository.
  ```
  cd /opt/
  git init --bare media.git
  ```
  > *Creates a bare repository at `/opt/media.git`. A bare repository is used for sharing and collaboration, as it does not have a working directory.*

**Step 4: Verify the repository**
- Check the repository type and confirm it is bare.
  ```
  cd /opt/media.git
  ls
  git rev-parse --is-bare-repository
  ```
  > *Lists the contents of the repository and confirms it is a bare repository. The output should be `true`.*

**Step 5: Complete the task**
- Click on confirm to complete the task.
