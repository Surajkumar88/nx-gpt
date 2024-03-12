FROM ubuntu:20.04
USER root
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get install -y vim curl htop wget
RUN apt-get install -y openjdk-17-jdk 
RUN apt-get install -y python3-pip
RUN wget https://github.com/nutanix/nai-llm/archive/refs/tags/v0.3.tar.gz
RUN export WORK_DIR=/nai_llm_0.3
RUN mkdir $WORK_DIR
RUN tar -xvf /v0.3.tar.gz -C $WORK_DIR --strip-components=1