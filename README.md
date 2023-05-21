# Spring Initializr Project With My Preferences

***
This is my Spring initializr project for faster development starting.
The purpose of project when I start to develop a new Spring Boot backend application, i can immediately start it from
this project with the things I usally need for every application. \
So briefly the purpose is Faster start with usual stuff than an empty project for me. \
I hope this project can help anybody for faster start, or any technologies setup like Skaffold, Kubernetes, Docker...

If u want use this project, just replace the `placeholder` strings / files to your `artifactId` and change
the `com.example` to your `groupId` and last change my docker name `ronaimate` to 'your' docker registry name.

##### Initializr script (replace all string / file): Coming Soon..

***

## Contents:

- [Spring Boot](#spring-boot-project)
- [Travis CI/CD](#travis)
- [Dockerfile for Building](#dockerfile-building)
- [Dockerfile for local development](#dockerfile-development)
- [Docker Compose for local running](#docker-compose)
- [Kubernetes configurations](#kubernetes)
- [Skaffold for development for container based & Kubernetes applications](#skaffold)
- [Helm](#helm)

***

### Spring Boot project

This project contains only minimal dependencies what is needed for starting developement:

`spring-boot-starter-web` - The code has only a sample
Controller: [HomeController.java](https://github.com/ronaimate/placeholder/blob/master/src/main/java/com/example/placeholder/rest/HomeController.java).

`lombok` - Faster coding.

`spring-boot-starter-test`
`h2 (test scrope)` - For testing.

`spring-boot-starter-data-jpa - with postgresql JDBC driver` - If u want change postgresql to anything e.g: mysql,
mssql.. Just replace the postgresql jdbc dependency in the [pom.xml](pom.xml).

`spring-boot-starter-actuator` - For Kubernetes Liveness & Readiness probes.

### Travis

This is a very clearly CI / CD [platform](https://www.travis-ci.com/).
Just connect your git, and select your repo. - easy, fast, clear.\
***Only one requirement:*** Add your docker username / password to travis Env Variables.\
After you pushed this project to your master branch, the Travis automatically start building, and push the docker images
to your docker repo.\
You can modify the travis CI / CD in the [.travis.yml](.travis.yml)

### Dockerfile Building

The [Dockerfile](Dockerfile) has two steps.

1. Build and verify your project with maven.
2. Build final docker image.

### Dockerfile Development

I like this [Dockerfile-local](Dockerfile-local), at times need use it for local Running.

### Docker Compose

You can build and run your application with a postgres database (maven and java not required, just use this command):
`docker-compose up -f docker-compose-local.yml`

### Kubernetes

If u build the project with Travis, or u pushed docker image to docker-hub with manually, the project will be kubernetes
ready, just use following commands:

1. ***LOCAL ENRIVONMENT
   *** `kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.7.1/deploy/static/provider/cloud/deploy.yaml`
   [Read More](https://kubernetes.github.io/ingress-nginx/deploy/#quick-start)

2. `kubectl apply -f ./k8s`

***THE FIRST COMMAND DEPENDS ON WHERE U WILL RUN YOUR PROJECT!***\ it's automatically created the Preconfigured Ingress
Service. If u want to run your project in (Google) GKE / (AWS) EKS read
the [linked](https://kubernetes.github.io/ingress-nginx/deploy/#quick-start) site GKE / EKS sections, and run the
correct command. \
The second command is okey in local and cloud too, it's create the other objects, which you can see in this picture:

There is a strange part in the picture (postgres-pod). Yes it's not the best practice, I use it for development. \
In the production environment never use database on the container, just search AWS RDS, Google Databases...

![node.png](https://raw.githubusercontent.com/ronaimate/placeholder/master/readme/node.png)

### Skaffold

It's very-very good tool. You can develop yor application whatever it's running on kubernetes.

1. Install SKAFFOLD: https://skaffold.dev/docs/quickstart/
2. Use this command: `skaffold dev`
   and u can change the java sources or anything, the skaffold automatically sync your changes to kubernetes. Awesome
   tool.

### Helm

Coming Soon..