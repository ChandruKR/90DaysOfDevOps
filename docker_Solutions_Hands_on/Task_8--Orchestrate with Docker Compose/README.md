## Task 8: Orchestrate with Docker Compose

# 🐳 Docker Compose: Two-Tier Flask & MySQL Application  

This project sets up a **Flask web application** that connects to a **MySQL database** using **Docker Compose**.

---

## 📌 Project Structure  
- **MySQL Service (`mysql1`)**:  
  - Uses the **MySQL 5.7** image.  
  - Stores data in a **persistent volume** (`mysql_new_data`).  
  - Includes a **health check** to ensure the database is ready before the Flask app starts.  

- **Flask App (`flask-app`)**:  
  - Connects to MySQL using environment variables.  
  - Exposes port **5000** for API requests.  
  - Waits for the MySQL service to become healthy before starting.  

- **Custom Network (`twotier`)**:  
  - Ensures **isolated communication** between services.  

---

## ⚙️ Docker Compose File (`docker-compose.yml`)  

```yaml
version: "3.8"

services:
  mysql:
    image: mysql:5.7
    container_name: mysql1
    environment:
      MYSQL_ROOT_PASSWORD: admin
      MYSQL_DATABASE: chandrudb
      MYSQL_USER: admin
      MYSQL_PASSWORD: admin
    volumes:
      - ./mysql_new_data:/var/lib/mysql
    networks:
      - twotier
    ports:
      - "3306:3306"
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "127.0.0.1", "-uroot", "-padmin"]
      interval: 10s
      timeout: 5s
      retries: 5
      start_period: 60s

  flask-app:
    build:
      context: .
    container_name: flask-app
    ports:
      - "5000:5000"
    environment:
      MYSQL_HOST: mysql1
      MYSQL_USER: admin
      MYSQL_PASSWORD: admin
      MYSQL_DB: chandrudb
    networks:
      - twotier
    depends_on:
      mysql:
        condition: service_healthy

networks:
  twotier:

volumes:
  mysql_new_data:

```

### Configuration Details:
``` bash
flask-app:
    build:
      context: .
```
* Builds the Flask image from the local directory (.).
* The Dockerfile inside the directory will define how the Flask application is built.


### Healtcheck of a service and wait action
```yaml
depends_on:
      mysql:
        condition: service_healthy
```
* Waits for MySQL to be Ready before starting Flask.
* Uses MySQL’s health check to confirm that the database is fully initialized.

🚀 How to Run

1️⃣ Build and Start Containers
```sh
docker-compose up -d --build
```

2️⃣ Check Running Containers
```sh
docker ps
```
3️⃣ Stop and remove all containers
```sh
docker-compose down -v
```

✅ Key Configurations:

* Stores data persistently in ./mysql_new_data.
* Uses a health check to ensure MySQL is ready before Flask starts.
* Runs on a custom network (twotier) for security.
* Exposes port 3306 to the host machine.