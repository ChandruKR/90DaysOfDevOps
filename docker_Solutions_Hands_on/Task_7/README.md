
## Task 7: Configure Docker Networking

1) Create a Custom Docker Network:

```bash
ubuntu@MYLINUXEC2:/opt/docker/flask-twotier/two-tier-flask-app$ docker network create flask-mysqldb
04c3e2fee6c72ac01d4f0d1da13deb888a55c014b07633030889f7cb4d009904
ubuntu@MYLINUXEC2:/opt/docker/flask-twotier/two-tier-flask-app$ docker network ls | grep -i flask
04c3e2fee6c7   flask-mysqldb   bridge    local

```
2) Run Containers on the Same Network and attaching it to common docker newtwork bridge

   * Container 1 starting up Database first:

```bash
    ubuntu@MYLINUXEC2:/opt/docker/flask-twotier/two-tier-flask-app$ docker run -d --name mysql1 -v mysql_data1:/var/lib/mysql --network=flask-mysqldb -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_USER=admin -e MYSQL_PASSWORD=admin -e MYSQL_DATABASE=chandrudb -p 3306:3306 mysql:5.7
    a168b86058669f229703f10645fea875aadc7a05cd89ec47695a57611c32e8a9
    ubuntu@MYLINUXEC2:/opt/docker/flask-twotier/two-tier-flask-app$ docker ps
    CONTAINER ID   IMAGE       COMMAND                  CREATED         STATUS         PORTS                                                  NAMES
    a168b8605866   mysql:5.7   "docker-entrypoint.s…"   4 seconds ago   Up 3 seconds   0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 33060/tcp   mysql1

```
* Verify if container is added by using docker inspect
```bash
ubuntu@MYLINUXEC2:/opt/docker/flask-twotier/two-tier-flask-app$ docker network inspect flask-mysqldb | grep -C4 mysql1
        },
        "ConfigOnly": false,
        "Containers": {
            "a168b86058669f229703f10645fea875aadc7a05cd89ec47695a57611c32e8a9": {
                "Name": "mysql1",
                "EndpointID": "8bebc6c54bfce09808cf2acb34252aaa819f2672793438ef74188ce8a908eba8",
                "MacAddress": "02:42:ac:12:00:02",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""

```
   * Container 2 starting up App and attaching it to common docker newtwork bridge

```bash
    ubuntu@MYLINUXEC2:/opt/docker/flask-twotier/two-tier-flask-app$ docker run -d -p 5000:5000 --network=flask-mysqldb --name=flaskapp -e MYSQL_HOST=mysql1 -e MYSQL_USER=admin -e MYSQL_PASSWORD=admin -e MYSQL_DB=chandrudb myflask-img:latest
    8bb72e0e2d4c32971d3e87a4b20385d89d84ec3a3eb89b4cef72cac90f430b1d
    ubuntu@MYLINUXEC2:/opt/docker/flask-twotier/two-tier-flask-app$ docker ps
    CONTAINER ID   IMAGE                COMMAND                  CREATED         STATUS         PORTS                                                  NAMES
    8bb72e0e2d4c   myflask-img:latest   "python app.py"          4 seconds ago   Up 2 seconds   0.0.0.0:5000->5000/tcp, :::5000->5000/tcp              flaskapp
    a168b8605866   mysql:5.7            "docker-entrypoint.s…"   3 minutes ago   Up 3   minutes   0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 33060/tcp   mysql1
    ubuntu@MYLINUXEC2:/opt/docker/flask-twotier/two-tier-flask-app$

```

* Inspect docker network name 'flask-mysqldb'
```bash
ubuntu@MYLINUXEC2:/opt/docker/flask-twotier/two-tier-flask-app$ docker network inspect flask-mysqldb | grep -B7 mysql1
                "Name": "flaskapp",
                "EndpointID": "2d5a16162e8a842d8b8cd779da6334a3adfd7cedd5d4621e4656e07ccab021af",
                "MacAddress": "02:42:ac:12:00:03",
                "IPv4Address": "172.18.0.3/16",
                "IPv6Address": ""
            },
            "a168b86058669f229703f10645fea875aadc7a05cd89ec47695a57611c32e8a9": {
                "Name": "mysql1",

```

# 🐳 Docker Networking in Multi-Container Applications  

Docker networking enables containers to communicate with each other and external systems using **virtual networks**. It provides **isolation, security, and scalability**, making it essential for **multi-container applications**.  

## 🌐 Key Docker Network Types  
- **🔹 Bridge (Default)** – Enables communication between containers on the same host.  
- **🔹 Host** – Directly uses the host’s network for performance benefits.  
- **🔹 Overlay** – Connects containers across multiple Docker hosts in Swarm mode.  
- **🔹 None** – Disables networking for isolated containers.  

## 🚀 Significance in Multi-Container Applications  
✅ **Service-to-Service Communication** – Containers (e.g., app, database) can communicate seamlessly.  
✅ **Load Balancing & Scaling** – Ensures efficient distribution of traffic.  
✅ **Security & Isolation** – Limits exposure by restricting external access.  
✅ **Flexible Deployment** – Works in both local and cloud environments.  
