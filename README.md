## v0.0.1
# Meteor-DockerContainer
A Docker Container that runs Meteor

# Usage
## Step 1
Copy the Dockerfile to your project.

## Step 2
Then in your project directory do:
```
docker build -t <image tag> .
// the -t flag stands for "tag"
```
**I usually call it meteorbase**

## Step 3
```
docker run -dp <hostport>:8080 --name <conatiner name> <image tag>
// -d for deattached mode
// -p <hostport>:8080 map a hostport to the published port in the container
// --name <container name> The name of the container
```

## Managing Containers/Images
```
docker kill <conatiner name>
docker rm <conatiner name>
docker rmi <image tag>

docker stop
docker start
```

# ToDo
* busybox
* https
* external mongodb container
* Mount the project dir as a VOLUME

# Ressources
https://www.docker.com/
https://docs.docker.com/reference/builder/
https://docs.docker.com/reference/commandline/cli/
http://docs.docker.com/reference/run/
