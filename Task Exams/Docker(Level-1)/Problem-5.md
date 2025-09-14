# Question
The Nautilus DevOps team was testing a custom container on Application Server 3 in Stratos DC. After configuring it as required, they now want to create a Docker image from this running container.

**Container Name:** `alpine_nautilus`
**Target Image:** `alpine:nautilus`

---

## Step-by-Step Solution

**Step 1: SSH into Application Server 3 & change to root user**

- Connect to Application Server 3 using SSH as the specified user, then switch to the root user for Docker administrative tasks.

```bash
ssh banner@stapp03
sudo su -
```
> *Establishes a secure shell session to Application Server 3 and elevates privileges to root, which is required for Docker operations.*

---

**Step 2: Commit the running container to a new image**

- Use the `docker commit` command to create a new image from the existing container.

```bash
docker commit alpine_nautilus alpine:nautilus
```
> *`docker commit` creates a new image from the changes made to a running container. Here, `alpine_nautilus` is the source container, and `alpine:nautilus` is the new image name and tag.*

---

**Step 3: Verify the new image exists**

- List Docker images and filter for the `alpine` image to confirm the new image was created successfully.

```bash
docker images | grep alpine
```
> *Displays all Docker images and filters the output to show only entries related to `alpine`. You should see an entry for `alpine` with the `nautilus` tag.*

---

**Summary:**
- You have successfully created a new Docker image `alpine:nautilus` from the running container `alpine_nautilus` on Application Server 3.

