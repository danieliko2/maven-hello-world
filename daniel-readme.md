# Home Exercise - Daniel Kohav

# ABOUT
This project is based on a fork of the following git repository:  
https://github.com/ido83/maven-hello-world  
  
The source code was edited in 2 places:  
pom.xml (version > 1.0.0)  
App.java (Hello World, Daniel Kohav)  
  
-- General --  
It implements a pipeline in GitHub Actions that on each run:  
Increments the artifact version by 0.0.1 (in the pom.xml file).  
Compiles the source code and packages it to a JAR artifact, using a Maven Docker image. The app is ran in a JRE based image.  
Uploads the image to a Dockerhub repository.  
Downloads and runs the Docker image.  
A project design can be viewed here:  
https://drive.google.com/file/d/1cKiLoo7VqYi2XDxwuULPg2FyYibs1qCW/  
  

-- Dockerfile --  
I used 2 base Docker images, inside a multistage Dockerfile:  
maven:3.8.7-openjdk-18-slim - for building the code.  
openjdk:8-jre-alpine - for running the Artifact.  
  
All the commands are ran using a non-root user.  
  
  
-- GitHub Actions --  
A single Job, with multiple stages:  
Connect to repo - Get the last commit to runner's working directory.  
Versioning stage - Get the last version from Dockerhub and increment by 0.0.1. If image does not exist (empty repo) set version to 1.0.0.  
Set up Docker Buildx - For using Docker on runner.  
Login to DockerHub - Self explanatory.  
Build image and push to DockerHub - Build the image, upload it to Dockerhub with the new version.  
Run the image - Download the image from Dockerhub and run it.  
  
  
# USAGE  
Open a new public container repository on DockerHub.  
Create an access key with read/write permissions on Dockerhub. Save it, we will use it later.  
Fork the git repository: https://github.com/danieliko2/maven-hello-world  
Create an environment named 'hw_env' for the project (Settings >> Environments >> New environment).  
Create 2 environment secrets:  
DH_UN - Your Dockerhub Username.  
DH_AT - The access key we just generated.  
and 1 environment variable:  
DH_REPO - The name of the Dockerhub repository (example: my_user/maven_hw_repo).  
  
If an image does not exist in the repository, after a successful run, a 1.0.0 tagged image will be uploaded to the Dockerhub repository.  
On  each next successful run, the tag will increment by 0.0.1.  
  
# EXTRAS  
I recommend reading the Journal (journal.docx), describing Bibok the Alien's adventure on Earth.  