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
Initializing a MongoDB container:
```
docker run -t mongo_<name of your app> -v <host directory>:<virtual directroy> mongo
# -t Tags the created container
# -v Mounts <host directory> as <virtual directroy> in your container
# The -v (VOLUME) flag isn't necessary but i think it's nicer not to have your data inside the container
# The mongo image lies on dockerhub and will be automatically pulled with this command
```

### Step 2
Demeteorizing your meteor-app:
demeteorizer is a super simple tool that converts your meteor app to a simple nodejs app.
It's used here because you have to `meteor build` your app to run it in production.
And the builds from `Meteor build` aren't very clean.
```
# In your projects directory do:
demeteorizer
# This creates a .demeteorized directory
```

### Step 3
Building your image
```
docker build -t <app name> .
```

### Step 4
Running your image
```
docker run -dp <host port>:80 --link db_<app name>:mongo --name <app name> <app name>
docker run -itp <host port>:80 --link db_<app name>:mongo --name <app name> <app name>
```

## Independent
### Step 1
Copy a Dockerfile to your project.

### Step 2
Then in your project directory do:
```
docker build -t <image tag> .
## the -t flag stands for "tag"
```
**I usually call it meteorbase**

### Step 3
```
docker run -dp <hostport>:8080 --name <conatiner name> <image tag>
# -d for deattached mode
# -p <hostport>:8080 map a hostport to the published port in the container
# --name <container name> The name of the container
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
