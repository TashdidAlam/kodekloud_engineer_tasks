# Question
The Nautilus DevOps team needs to set up several Docker environments for different applications. One of the team members has been assigned a ticket to create some Docker networks to be used later. Complete the task based on the following ticket description:

**a. Create a Docker network named `ecommerce` on App Server 1 in Stratos DC.**
**b. Configure it to use macvlan drivers.**
**c. Set it to use subnet `192.168.30.0/24` and iprange `192.168.30.0/24`.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH into App Server 1 and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh tony@stapp01
  sudo su -
  ```
  > *Establishes a secure shell session to App Server 1 as user tony, then switches to root for administrative access.*

**Step 2: Create the ecommerce macvlan network**
- Use the docker network create command with the required options.
  ```
  docker network create -d macvlan \
    --subnet=192.168.30.0/24 \
    --ip-range=192.168.30.0/24 \
    --gateway=192.168.30.1 \
    ecommerce
  ```
  > *Creates a new Docker network named `ecommerce` using the macvlan driver, with the specified subnet, IP range, and gateway.*

**Step 3: Verify the network**
- List and inspect the created network to confirm its configuration.
  ```
  docker network ls
  docker network inspect ecommerce
  ```
  > *Ensures the network exists, uses the macvlan driver, and has the correct subnet and IP range.*

**Step 4: Complete the task**
- Click on confirm to complete the task.