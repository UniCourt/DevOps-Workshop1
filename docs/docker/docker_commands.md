# Docker Commands
The basic commands for the Docker CLI.
<hr>


## 1. Docker without sudo

- To run docker commands as normal user without sudo, we need to create a group for docker and add the user to it.

1. Create the docker group
    ```shell
    $ sudo groupadd docker
    ```
2. Add your user to docker group
    ```shell
    $ sudo usermod -aG docker $USER
    ```
3. Activate the changes to groups:
    ```shell
   $ newgrp docker
    ```
4. Verify that you can run docker commands without sudo.
    ```shell
   $ docker ps
    ```
<hr>

## 2. Docker version
To find the installed docker version
Command:
```
docker  --version
``` 
Example:
```
docker --version
Docker version 19.03.9, build 9d988398e7
```
<hr>

## 3. Downloading image
To work with any Docker image we need to download the docker image first.<br /> 
Command:
```
docker pull <IMAGE>
```
Example of pulling alpine:latest image
```
docker pull alpine:latest
```
<hr>

## 4. List all the docker images
To list all the images that are available in the host machine.
<br />
Command:
```
docker images
```
Example:

```
REPOSITORY  TAG     IMAGE ID        CREATED      SIZE
alpine      latest  c059bfaa849c    6 weeks ago  5.59MB
```
<hr>

## 5. Run docker image
The `docker run` command is used to launch Docker containers.

When the `docker run` commands is executed an isolated process with its own filesystem and network is spawned.
<br>
Command:
```
docker run [options] <IMAGE>
```

Example of running alpine:latest image
- -t allows us to access the terminal
- -i gets stdin stream added to the container stdin
```
docker run -t -i alpine:latest
or
docker run -ti alpine:latest

exit
```
<hr>

## 6. Running containers
 `docker ps` will list the running containers
<br>
Command:
```
docker ps
```
Example:
```
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
8973c7347905        alpine:latest       "/bin/sh"           2 minutes ago       Up 2 minutes                            ecstatic_jang
```
<hr>

## 7. Access the docker container
`docker exec` executes a command in a running container.
<br>
Command to execute into container:
```
docker exec [OPTIONS] <CONTAINER_ID> COMMAND
```
> Explore options [here](https://docs.docker.com/engine/reference/commandline/exec/)

Example: Execute into running `alpine:latest` container. Let us create one directory and a simple blank text file 
inside the container.
```
docker exec -ti 8973c7347905 sh
/ # mkdir demo
/ # cd demo
/demo # touch helloworld.txt
/demo # ls
helloworld.txt
/demo # 
```
`mkdir` command to create a directory or folder<br />
`cd` change directory used to change the current working directory <br />
`touch` command to create a blank file<br />
<hr>

## 8. Stop the container
`docker stop` command to stop the running container 
<br />
Command:
```
docker stop [OPTIONS] <CONTAINER_ID>
or
docker stop [OPTIONS] <CONTAINER_NAME>
```
> Explore options [here](https://docs.docker.com/engine/reference/commandline/stop/)

Example of stopping alpine:latest running container
```
docker stop 8973c7347905 
or
docker stop <CONTAINER_NAME>
```
Here once you stop the container, the container is still available locally, but it is not in the running state.<br>
<hr>

## 9. List all the containers
`docker ps -a` will list all the containers including stopped containers.
<br>
Example output:
```
docker ps -a
CONTAINER ID        IMAGE                     COMMAND                  CREATED             STATUS                       PORTS                                                 NAMES
4cc4008815d8        alpine:latest             "/bin/sh"                57 minutes ago      Exited (137) 2 minutes ago
```
<hr>

## 10. Start the container
Let's start the stopped `alpine:latest` container again.
<br>
Command:
```
docker start [OPTIONS] <CONTAINER_ID>
```
> Explore options [here](https://docs.docker.com/engine/reference/commandline/start/)

Example of starting alpine:latest container.<br>
Before starting the container we need the container id,so let's get the container id by `docker ps -a` command.
```
docker ps -a

docker start 4cc4008815d8
```
<hr>

## 11. Remove the container 
You can remove the container or multiple containers by `docker rm` command.<br>
Command
```
docker rm [OPTIONS] <CONTAINER...>
```
> Explore Options [here](https://docs.docker.com/engine/reference/commandline/rm/)
Example:
```
docker rm 4cc4008815d8
```
Note: Execute this only after you stop the container
<hr>

## 12. Removing image
You can remove the local images by `docker rmi` command.
<br>
Command:
```
docker rmi [OPTIONS] <IMAGE_ID> / <IMAGE_ID...>
```
Example: Remove alpine:latest image
```
docker rmi c059bfaa849c
```
<hr>