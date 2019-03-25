FROM debian:stretch-slim

MAINTAINER Student Studencki <student.wazny@uj.edu.pl>

RUN useradd ujot --create-home

RUN apt-get update
RUN apt-get install -y vim unzip curl git
RUN apt-get install -y software-properties-common gnupg2 apt-transport-https apt-utils

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
RUN apt-get update
RUN apt-get install -y sbt

EXPOSE 9000

RUN mkdir /home/shared
VOLUME ["/home/shared/"]
WORKDIR /home/
RUN git clone https://github.com/playframework/play-scala-slick-example
WORKDIR /home/play-scala-slick-example/
CMD sbt run

