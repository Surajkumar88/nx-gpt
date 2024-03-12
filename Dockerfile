FROM ubuntu:20.04
USER root
RUN apt update, apt -y dist-upgrade
RUN apt install -y vim curl htop wget
RUN apt-get install openjdk-17-jdk python3-pip
