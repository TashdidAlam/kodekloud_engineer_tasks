# Question
A developer `mark` has been assigned Nautilus project temporarily as a backup resource. As a temporary resource for this project, we need a temporary user for mark. It’s a good idea to create a user with a set expiration date so that the user won't be able to access servers beyond that point.

Therefore, create a user named `mark` on the App Server 1. Set expiry date to `2023-04-15` in Stratos Datacenter. Make sure the user is created as per standard and is in lowercase.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

**Step 1: Log in to App Server 1**
- Connect to the target server using SSH.
  ```
  ssh tony@stapp01
  ```
  > *This command establishes a secure shell session to App Server 1 as user tony.*

**Step 2: Switch to the root user**
- Gain root privileges to perform administrative tasks.
  ```
  sudo su
  ```
  > *Switching to root is necessary to add or modify user accounts.*

**Step 3: Check if the user 'mark' already exists**
- Verify if the user is present on the system.
  ```
  id mark
  ```
  > *This command checks for the existence of the user 'mark' and displays their UID and group info if present.*

**Step 4: Create the user 'mark' if not present**
- Add the user to the system.
  ```
  adduser mark
  ```
  > *This command creates a new user named 'mark' with default settings.*
  ```
  id mark
  ```
  > *Re-check to confirm the user was created successfully.*

**Step 5: Set the expiry date for the user 'mark'**
- Assign an expiration date to the account.
  ```
  chage -E 2023-04-15 mark
  ```
  > *This command sets the account expiry date to 2023-04-15, after which 'mark' will not be able to log in. Useful for temporary accounts.*

**Step 6: Verify the new expiry date**
- Confirm the expiry date is set correctly.
  ```
  chage -l mark
  ```
  > *This command lists the account aging information, including the expiry date, for the user 'mark'.*

**Step 7: Complete the task**
- Click on confirm to complete the task