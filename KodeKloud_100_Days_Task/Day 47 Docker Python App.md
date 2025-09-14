A python app needed to be Dockerized, and then it needs to be deployed on App Server 2. We have already copied a requirements.txt file (having the app dependencies) under /python_app/src/ directory on App Server 2. Further complete this task as per details mentioned below:



Create a Dockerfile under /python_app directory:

Use any python image as the base image.
Install the dependencies using requirements.txt file.
Expose the port 6200.
Run the server.py script using CMD.

Build an image named nautilus/python-app using this Dockerfile.


Once image is built, create a container named pythonapp_nautilus:

Map port 6200 of the container to the host port 8093.

Once deployed, you can test the app using curl command on App Server 2.


curl http://localhost:8093/

1. Create the Dockerfile

Inside /python_app:

sudo vi /python_app/Dockerfile


Add the following content:

# Use Python base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements.txt
COPY src/requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY src/ .

# Expose the app port
EXPOSE 6200

# Run the app
CMD ["python", "server.py"]

2. Build the image
cd /python_app
sudo docker build -t nautilus/python-app .

3. Run the container
sudo docker run -d --name pythonapp_nautilus -p 8093:6200 nautilus/python-app

4. Verify

Check container:

docker ps


Test app:

curl http://localhost:8093/