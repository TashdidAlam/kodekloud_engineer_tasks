a. lab1_container
# Question

The DevOps team found that two containers (`lab1_container` and `lab2_container`) on Application Server 3 in Stratos DC have exited. Your task is to investigate and ensure both containers are running.

**Containers to Check:**
- `lab1_container`
- `lab2_container`

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

**Step 2: Check the current status of the containers**

- List all containers and filter for the target containers to see their current status.

```bash
docker ps -a | egrep 'lab1_container|lab2_container'
```
> *Lists all containers (including stopped ones) and filters the output to show only `lab1_container` and `lab2_container`. You should see both with Exited status if they are not running.*

---

**Step 3: Start the exited containers**

- Start both containers using the following command:

```bash
docker start lab1_container lab2_container
```
> *Starts the specified containers. If successful, their status will change from Exited to Up.*

---

**Step 4: Verify the containers are running**

- List only running containers and filter for the target containers to confirm they are up.

```bash
docker ps | egrep 'lab1_container|lab2_container'
```
> *Shows only running containers. You should now see both containers with Up status, confirming they are running.*

---

**Summary:**
- You have checked the status and restarted the exited containers `lab1_container` and `lab2_container` on Application Server 3, ensuring both are now running.

