## v0.0.1
# Meteor-DockerContainer
A Docker Container that runs Meteor

# Versions
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
# Create the necessary structure on your host machine
mkdir -p <host directory>/db
# This can be what ever you want (I use '/data/<projectname>')
# -p is to create the whole structure

docker run --restart=always -d --name mongo_<name of your app> -v <host directory>:/data mongo
# --restart=always make the container always restart when it stops
# -d to run it in detached mode
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
docker run -dp <host port>:80 --link db_<app name>:mongo --name <app name> --restart=always <app name>
# -d to run the conatiner in deamon mode
# -p to link a host port to port 80 (where your app will be run)
# --link to link the db container (db_<app name>) to your app's container and alias it as 'mongo'
# My script expects the  mongo container to be aliased as 'mongo'
# --name the name of the running container
# --restart=always make the container always restart when it stops
# A word of caution about this:
#  This parameter is used by my script in naming the actual DB
#  So be careful with specialchars

# If you want to make changes to your container you have to run:
docker exec <some command>
# If the changes you will be making are complex it's easier to run bash in the container:
docker exec -it bash
# To exit press ctrl+p, ctrl+q
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
