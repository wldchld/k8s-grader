FROM apluslms/grading-base:4.6

ADD docker /bin/
# yllä olevat toimii dockerin löytämiseen
RUN ls

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl wget net-tools procps host nano
    
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&\
    apt-get install -y nodejs

COPY minikube-linux-amd64 /mk/minikube-linux-amd64
COPY cached-minikube-image.tar.lz4 /mk/.minikube/cache/preloaded-tarball/preloaded-images-k8s-v17-v1.23.3-docker-overlay2-amd64.tar.lz4

COPY kicbase-image /mk/kicbase-image

RUN chmod -R 777 /mk

RUN install /mk/minikube-linux-amd64 /usr/local/bin/minikube

ENV DOCKER_TLS_VERIFY=1
ENV DOCKER_CERT_PATH=/exercise/client-certs
ENV DOCKER_HOST=tcp://docker:2376
ENV MIKKO_GRADER_VERSION=20230225.001
