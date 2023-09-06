These instructions are written for Linux!

- Install Docker (instructions vary between distributions, so I will not go through them here)
- Download the kicbase image with command `docker pull gcr.io/k8s-minikube/kicbase:v0.0.40`
- Export it to a file with command `docker save gcr.io/k8s-minikube/kicbase:v0.0.40 -o kicbase-image`
- Download minikube binary and install it on your PC

    ``` 
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube 
    ``` 

- Start minikube with command `minikube start ` and after it has started up you will find the
  cached tarball (.tar.lz4 file) from `~/.minikube/cache/preloaded-tarball/`. Copy that file
  to this directory and name it `cached-minikube-image.tar.lz4`
- Download Docker v.20.10.x binaries from https://download.docker.com/linux/static/stable/
    - Unpack the tarball and move the binaries to a directory named `docker` into the root of this reposiory
- Build the Docker image with command `docker build -t k8s-grader .` 
