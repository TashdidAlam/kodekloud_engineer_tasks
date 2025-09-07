# Question
Nautilus project developers are planning to start testing on a new project. As per their meeting with the DevOps team, they want to test containerized environment application features. As per details shared with the DevOps team, we need to accomplish the following task:

**a. Pull `busybox:musl` image on App Server 2 in Stratos DC and re-tag (create new tag) this image as `busybox:media`.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: Log into App Server 2 and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh steve@stapp02
  sudo su
  ```
  > *Establishes a secure shell session to App Server 2 as user steve, then switches to root for administrative access.*

**Step 2: Pull the `busybox:musl` image**
- Download the required image from Docker Hub.
  ```
  docker pull busybox:musl
  ```
  > *Ensures the specific `busybox:musl` image is available locally for tagging and use.*

**Step 3: Re-tag the image as `busybox:media`**
- Create a new tag for the pulled image.
  ```
  docker tag busybox:musl busybox:media
  ```
  > *Creates a new tag `media` for the existing `busybox` image, allowing it to be referenced as `busybox:media`.*

**Step 4: Verify the new tag**
- List all Docker images to confirm the new tag exists.
  ```
  docker images
  ```
  > *Displays all available images and tags, confirming that `busybox:media` is present.*

**Step 5: Complete the task**
- Click on confirm to complete the task
