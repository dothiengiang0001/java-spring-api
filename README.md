# Create a REST API in Spring Boot with MYSQL on Docker

## Run MYSQL

```bash
docker run -itd -p 3316:3306 -v "${pwd}/db/script/setup.sql:/docker-entrypoint-initdb.d/setup.sql" -e MYSQL_ROOT_PASSWORD=root1234 -v mysql_data:/var/lib/mysql mysql:5.7
```

## Build App & Run

1. Open terminal and find ip address

```
# windows:
ipconfig /all

# ubuntu
ip address
```

2. Put your IP address on <you_ip_addr> in file `src/main/resources/application.properties` at line `spring.datasource.url`

3. Build image

```bash
docker build -t java-api:v1.0 -f Dockerfile .
# 
```

4. Run container

```bash
docker run --name java-api -p 8008:8080 java-api:v1.0
```

5. Run with Compose


```bash
# Build image first
docker build -t java-api:v3 -f Dockerfile .
# Start services in docker compose
docker-compose -f docker-compose.yaml up -d
```

5. Run with Full Compose


```bash
# build & start services in docker compose
docker-compose -f docker-compose-build.yaml up -d --build
```

# Testing time

Open browser:

http://localhost:8008/users/
