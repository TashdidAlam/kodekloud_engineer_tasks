
# Problem 7: Remove a Docker Network on Application Server 3

The Nautilus DevOps team needs to clean up old and unused Docker networks on Application Server 3 in Stratos Datacenter. Specifically, you need to delete a Docker network named `php-network`.

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

**Step 2: Check if the Docker network exists**

- List all Docker networks and filter for `php-network` to confirm it exists before attempting removal.

```bash
docker network ls | grep php-network
```
> *Lists all Docker networks and filters the output to show only the `php-network` entry. If nothing is returned, the network does not exist.*

---

**Step 3: Remove the Docker network**

- Remove the `php-network` using the following command:

```bash
docker network rm php-network
```
> *Deletes the specified Docker network. If the network is still in use by any containers, you will see an error. In that case, disconnect or stop/remove the containers attached to it before retrying.*

---

**Step 4: Verify the network has been deleted**

- List Docker networks again to ensure `php-network` is no longer present.

```bash
docker network ls | grep php-network
```
> *If nothing is returned, the network has been successfully removed.*

---

**Summary:**
- You have successfully removed the `php-network` Docker network from Application Server 3 after verifying its existence and ensuring it was not in use.

