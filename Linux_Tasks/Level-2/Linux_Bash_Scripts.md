# Question
The production support team of xFusionCorp Industries is working on developing bash scripts to automate different day-to-day tasks. One requirement is to create a bash script for taking website backups. They have a static website running on App Server 3 in Stratos Datacenter, and need to create a bash script named `ecommerce_backup.sh` to accomplish the following tasks. (Place the script under `/scripts` directory on App Server 3.)

**a. Create a zip archive named `xfusioncorp_ecommerce.zip` of `/var/www/html/ecommerce` directory.**
**b. Save the archive in `/backup/` on App Server 3.**
**c. Copy the created archive to Nautilus Backup Server in `/backup/` location.**
**d. Ensure the script won't ask for password while copying the archive file. The respective server user (e.g., `banner` for App Server 3) must be able to run it.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

**Step 1: SSH into App Server 3**
- Connect to the target server using SSH.
  ```
  ssh banner@stapp03
  ```
  > *Establishes a secure shell session to App Server 3 as user banner.*

**Step 2: Create the backup script in /scripts directory**
- Open a new file for the backup script.
  ```
  vi /scripts/ecommerce_backup.sh
  ```
  > *Creates and opens the script file for editing in the /scripts directory.*

**Step 3: Add commands to the script**
- Insert the following lines into the script:
  ```
  #!/bin/bash
  zip -r /backup/xfusioncorp_ecommerce.zip /var/www/html/ecommerce
  scp /backup/xfusioncorp_ecommerce.zip clint@stbkp01:/backup
  ```
  > *Creates a zip archive of the website directory and securely copies it to the backup server.*

**Step 4: Set up password-less SSH for file transfer**
- Generate an SSH key pair and copy it to the backup server.
  ```
  ssh-keygen
  ssh-copy-id clint@stbkp01
  ssh clint@stbkp01
  exit
  ```
  > *Generates a key pair and copies the public key to the backup server, enabling password-less authentication for secure file transfer. Test login to confirm no password prompt.*

**Step 5: Run the backup script**
- Execute the script to perform the backup and transfer.
  ```
  cd /scripts
  sh ecommerce_backup.sh
  ```
  > *Runs the backup script, which creates the archive and transfers it to the backup server.*

**Step 6: Verify the backup on both servers**
- Check the backup directory for the zip file on both App Server 3 and the backup server.
  ```
  ls -la /backup
  ssh clint@stbkp01
  ls -la /backup
  exit
  ```
  > *Ensures the backup file exists in the correct location on both servers.*

**Step 7: Complete the task**
- Click on confirm to complete the task.