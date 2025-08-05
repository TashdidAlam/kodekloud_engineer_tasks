# Question
The system admins team of xFusionCorp Industries has set up some scripts on jump host that run on regular intervals and perform operations on all app servers in Stratos Datacenter. To make these scripts work properly we need to make sure thor user on `jump host` has password-less SSH access to all app servers through their respective `sudo users`. Based on the requirements, perform the following:

**Set up a password-less authentication from user `thor` on `jump host` to all app servers through their respective `sudo users`.**

> **Important:** Do not perform this task as the root user on the jump server. All steps must be done as the `thor` user.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

**Step 1: Ensure you are logged in as thor user on the jump host**
- Confirm your current user is `thor`.
  ```
  whoami
  ```
  > *Verifies you are operating as the correct user (`thor`). Password-less SSH setup must be done from this user, not root.*

**Step 2: Generate an SSH key pair (if not already present)**
- Create a new RSA key pair for authentication.
  ```
  ssh-keygen -t rsa
  ```
  > *Generates a public/private RSA key pair for the `thor` user. Press Enter to accept defaults if prompted.*

**Step 3: Copy the public key to all app servers' sudo users**
- Use `ssh-copy-id` to enable password-less SSH for each target user/server.
  ```
  ssh-copy-id tony@stapp01
  ssh-copy-id steve@stapp02
  ssh-copy-id banner@stapp03
  ```
  > *Copies the public key to the `authorized_keys` file of each sudo user on the respective app server, enabling password-less SSH login for `thor`.*

**Step 4: Complete the task**
- Click on confirm to complete the task