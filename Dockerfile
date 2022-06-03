FROM ubuntu:18.04
WORKDIR /root

# Setup apt packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    git \
    gnupg \
    curl \
    file \
    unzip \
    wget \
    xz-utils \
    zip

# Setup dart
RUN apt-get update && \
    apt-get install apt-transport-https && \
    sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' && \
    sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
RUN apt-get update && \
    apt-get install dart && \
    echo 'export PATH="$PATH:/usr/lib/dart/bin"' >> ~/.profile

# Setup flutter
RUN mkdir tools && \
    git clone https://github.com/flutter/flutter.git -b stable 

RUN export PATH="$PATH:/root/flutter/bin" && \
    flutter precache && \
    flutter doctor -v