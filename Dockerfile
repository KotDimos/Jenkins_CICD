FROM jenkins/jenkins:latest

USER root

RUN apt-get update \
    && apt-get install -y \
        curl \
        gnupg2 \
        ca-certificates \
        apt-transport-https \
        software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin

RUN usermod -aG docker jenkins

USER jenkins
