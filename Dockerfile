FROM ubuntu:20.04
USER root
RUN apt-get update, apt-get -y dist-upgrade
RUN apt-get install -y vim curl htop wget
RUN apt-get install openjdk-17-jdk python3-pip
