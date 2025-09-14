# Question

The Nautilus DevOps team needs specific Docker images on Application Server 3 in Stratos DC. These images will be used to create containers later.

**Images to Pull:**
- `redis:alpine`
- `memcached:alpine`

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

**Step 2: Pull the required Docker images**

- Pull the Redis Alpine image from Docker Hub:

```bash
docker pull redis:alpine
```
> *Downloads the `redis:alpine` image from Docker Hub to the local system, making it available for container creation.*

- Pull the Memcached Alpine image from Docker Hub:

```bash
docker pull memcached:alpine
```
> *Downloads the `memcached:alpine` image from Docker Hub to the local system, making it available for container creation.*

---

**Step 3: Verify both images are available locally**

- List Docker images and filter for `redis` or `memcached` to confirm both images were pulled successfully.

```bash
docker images | egrep 'redis|memcached'
```
> *Displays all Docker images and filters the output to show only entries related to `redis` or `memcached`. You should see both images listed with the `alpine` tag.*

---

**Summary:**
- You have successfully pulled the `redis:alpine` and `memcached:alpine` images on Application Server 3, ready for container creation.

