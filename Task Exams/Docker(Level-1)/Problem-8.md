# Question

The Nautilus DevOps team needs to set up a custom Docker network on Application Server 3 in Stratos Datacenter as a prerequisite for container deployment.

**Network Details:**
- Name: `mysql-network`
- Driver: `bridge`
- Subnet: `182.18.0.0/24`
- Gateway: `182.18.0.1`

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

**Step 2: Create the custom Docker network**

- Use the following command to create a new Docker network with the specified driver, subnet, and gateway:

```bash
docker network create \
  --driver bridge \
  --subnet 182.18.0.0/24 \
  --gateway 182.18.0.1 \
  mysql-network
```
> *Creates a new Docker network named `mysql-network` using the bridge driver, assigns the custom subnet `182.18.0.0/24`, and sets the gateway IP to `182.18.0.1`.*
> - `--driver bridge`: Creates a bridge network (default for single-host networking).
> - `--subnet`: Assigns a custom subnet to the network.
> - `--gateway`: Sets the gateway IP for the network.
> - `mysql-network`: Name of the new network.

---

**Step 3: Verify the network configuration**

- Inspect the newly created network to confirm its configuration:

```bash
docker network inspect mysql-network
```
> *Displays detailed information about the `mysql-network`. Look for the following in the output:*
> - `"Driver": "bridge"`
> - `"Subnet": "182.18.0.0/24"`
> - `"Gateway": "182.18.0.1"`

---

**Summary:**
- You have successfully created a custom Docker bridge network named `mysql-network` with the specified subnet and gateway on Application Server 3.

