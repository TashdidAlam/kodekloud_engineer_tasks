# Question
The Nautilus team wants to create a debug container on Application Server 3. However, they had some specific requirements related to the CMD. Please complete the task as per details given below:

**a. On Application Server 3, create a container named `debug_3` using image `ubuntu/apache2:latest`.**
**b. Overwrite the default CMD with command `sleep 1000`.**
**c. Make sure the container is in running state.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH into Application Server 3 & changing to root user**
- Connect to Application Server 3 using SSH.
  ```
  ssh banner@stapp03
  sudo su -
  ```
  > *Establishes a secure shell session to Application Server 3 as the specified user.*

**Step 2: (If required) Switch to root user**
- Gain root privileges if needed to run Docker commands.
  ```
  sudo su
  ```
  > *Switches to the root user, which is often required for Docker operations.*

**Step 3: Run the container with the requested name, image, and overridden CMD**
- Start the container in detached mode, set the name, and override the default command.
  ```
  docker run -d --name debug_3 ubuntu/apache2:latest sleep 1000
  ```
  > *Runs the container in the background (`-d`), names it `debug_3`, uses the specified image, and overrides the default CMD with `sleep 1000` to keep the container running for debugging.*

**Step 4: Verify the container is running**
- Check that the container is up and running with the correct command.
  ```
  docker ps | grep debug_3
  ```
  > *Lists running containers and confirms that `debug_3` is running with `sleep 1000` as the command.*

**Step 5: Complete the task**
- Click on confirm to complete the task.