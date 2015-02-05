## v0.0.1
# Meteor-DockerContainer
A Docker Container that runs Meteor

# Roudmap
I'm making three versions of the original dockerfile.
* **Independent** running centos, internal DB.
* **Componentized** running centos, using demeteorizer, external DB. Needs a Mongo container linked to it.

# Usage
## Componentized
The componentized version runs a demeteorizer meteor app.
It doesn't run a MongoDB.
That is particularly interesting for production.
You could hypotetically distribute the DB in a cloud.

### Step 1
Initializing a MongoDB container.

## Independent
### Step 1
Copy a Dockerfile to your project.

### Step 2
Then in your project directory do:
```
docker build -t <image tag> .
// the -t flag stands for "tag"
```
**I usually call it meteorbase**

### Step 3
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
