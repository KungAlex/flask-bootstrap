############################################################
# Dockerfile for base Flask-bootstrap Application 
# based on ubuntu:latest
############################################################

FROM ubuntu:latest
MAINTAINER KungAlex <alexander.kleinschmidt@smail.fh-koeln.de>

## Set env variables used in this Dockerfile
ENV DEBIAN_FRONTEND=noninteractive
ENV DOCKYARD_SRC=./
ENV DOCKYARD_SRVHOME=/srv
ENV DOCKYARD_SRVPROJ=/srv/mySource


## Step 1: Install used standart Packages
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y \
    apt-utils \
    iproute2 \
    wget \
    net-tools \
    findutils \
    iputils-ping \
    git curl \
    python3 python3-pip


## Step 2: Copy requirements files
WORKDIR $DOCKYARD_SRVPROJ
ADD requirements.txt $DOCKYARD_SRVPROJ
RUN pip3 install -r requirements.txt
