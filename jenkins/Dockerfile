FROM jenkins/jenkins:lts

USER root

# Install Docker CLI, Git, curl and unzip
RUN apt-get update && \
    apt-get install -y \
        docker.io \
        git \
        curl \
        unzip && \
    rm -rf /var/lib/apt/lists/*

# Install Terraform
ENV TERRAFORM_VERSION=1.8.5

RUN curl -fsSL \
    https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    -o terraform.zip && \
    unzip terraform.zip && \
    mv terraform /usr/local/bin/ && \
    chmod +x /usr/local/bin/terraform && \
    rm terraform.zip

# Keep Jenkins running as root
USER root