# Question
Last week the Nautilus DevOps team met with the application development team and decided to containerize several of their applications. The DevOps team wants to do some testing per the following:

**Install `docker-ce` and `docker-compose` packages on App Server 3**
**Start docker service.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: Sign in to App Server 3 and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh banner@stapp03
  sudo su -
  ```
  > *Establishes a secure shell session to App Server 3 as user banner, then switches to root for administrative access.*

**Step 2: Add Docker repository and install Docker packages**
- Add the official Docker repository and install Docker Engine and CLI.
  ```
  dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
  dnf install docker-ce docker-ce-cli containerd.io
  ```
  > *Adds the Docker repository and installs the required Docker packages for CentOS.*

**Step 3: Enable and start Docker service**
- Enable Docker to start on boot and start the service immediately.
  ```
  systemctl enable --now docker
  systemctl start docker
  ```
  > *Ensures Docker is running and will start automatically after a reboot.*

**Step 4: Install Docker Compose**
- Download Docker Compose binary and make it executable.
  ```
  curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  ```
  > *Installs Docker Compose, a tool for defining and running multi-container Docker applications.*

**Step 5: (Optional) Add user to Docker group**
- Allow a specific user to run Docker commands without sudo.
  ```
  usermod -aG docker username
  ```
  > *Adds the specified user to the Docker group for permission to run Docker commands.*

**Step 6: Verify Docker and Docker Compose installation**
- Check installed versions and basic Docker functionality.
  ```
  docker --version
  docker images
  docker ps
  docker compose --version
  ```
  > *Verifies that Docker and Docker Compose are installed and working correctly.*

**Step 7: Complete the task**
- Click on confirm to complete the task
