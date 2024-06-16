# Expose Ports, Volume Mounts, Utilizing Networks, Limiting Resources
<hr>

## Exposing Ports:
### What is a Port?
A port is a communication endpoint. If the URL is the address or a building, the port is a particular door.
<br>
Only one application can use a port at a time.
<br>
Syntax: `URL:PORT`
<br>
For example: `127.0.0.1:8000`
<br>
Here 127.0.0.1 is the URL and 8000 is the port.

### Why?
By default a docker container does not publish any ports to the host machine. So the services running inside the container will not be accessible from the host machine. So we need to expose the ports to the host machine.
<br>

### How?
1.  docker run:
    <br>
    We use the `-p` flag followed by the `hostport:containerport` format while running the container.
    <br>
    Example: `docker run <CONTAINER_NAME> -p 8000:8080 bash`


2. docker-compose:
    <br>
    We specify the port under the `ports` key in the docker-compose.yaml file
    ```
    ports:
        -  "8000:8080"
    ```
<hr>

## Volume Mount:

### Why?
By default all files created inside a container are stored on a writable container layer. The data doesn’t persist when that container no longer exists, meaning the data inside the container gets deleted if the container stops.

### How?
1.  docker run:
    <br>
    We use the `-v` flag followed by the `<PATH IN THE HOST MACHINE>:<PATH INSIDE THE CONTAINER>` format while running the container.
    <br>
    Example: `docker run -it -v /home/workshop/Downloads:/home/usr/Downloads alpine sh`


2. docker-compose:
    <br>
    We specify the volume under the `volumes` key in the docker-compose.yaml file
    ```
    volumes:
       - "/home/workshop/Downloads:/home/usr/Downloads"
    ```
    Named volumes are created and managed by docker. For instance, if we want our data in a PostgreSQL container to be persistent. 
    We need define a named volume in the top-level volumes key.
    ```
    version: "3.7"

    services:
      db:
        image: postgres
        container_name: app_database
        ports:
          - '192.168.1.53:5432:5432'
        environment:
          - POSTGRES_NAME=postgres
          - POSTGRES_USER=postgres
          - POSTGRES_PASSWORD=postgres
          - POSTGRES_DB=flask_db
        volumes:
          - my-db:/var/lib/postgres

    volumes: 
      my-db
    ```
<hr>

## Utilizing Network:

### Types:
1.  Bridge: (Isolation)
This is the default network type. This allows the containers on the same bridge network to communicate. Containers within the network can talk to each other.
Demo:

Start two alpine containers like:
```
docker run -dit --name alpine1 alpine ash

docker run -dit --name alpine2 alpine ash
```
Show all the bridge networks like:
```
docker network inspect bridge
```
Now you can exec into one of the alpine containers and ping the other one based on its IP.

2. Host: (With Host)
Here the container’s network stack is not isolated from the host, meaning the host network can be accessible from the container. We use the `--network=host` parameter while running the docker container to use host network.
<br>

3.  None: (No network access)
The containers created using the `--network=none`. Here the container will not have any network access whatsoever. 
<hr>

## Limiting Resources:

### Why?
By default, a container has no resource constraints and can use as much of a given resource as the host’s kernel scheduler allows. This will be a problem because one container may use a lot of system resources and starve other processes and containers.
<br>
Docker allows us to control the amount of CPU and memory a container will use.

### How?
1.  docker run:
    <br>
    ####  For memory:
    We use the `-m` flag followed by a positive integer suffixed by `b`, `k`, `m`, `g` for byte, kilobyte, megabyte and gigabyte respectively.
    <br>
    Example: `docker run -it -m=100m <CONTAINER NAME> sh`
    #### For CPU:
    We use the `--cpus=<value>` where the value is CPU value. For instance if the host machine has 2 CPUs we can set the value as 1.5 so that container only uses 1.5 CPU.
    <br>
    Example: `docker run -it -cpus='1.5' <CONTAINER NAME> sh`

2.  docker-compose:
    <br>
    We specify the CPU and memory limits under the `deploy` key like so:
    ```
    version: "3.7"

    services:
      service-name:
        image: alpine
        deploy:
          resources:
            limits:
              cpus: '0.50'
              memory: 50M
    ```
<hr>

[`Docker Compose`](./docker_compose_introduction.md)<br>
[`Introduction to Postgres`](../postgres/postgres_introduction.md)