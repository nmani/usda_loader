FROM mysql:latest
MAINTAINER Naveen Manivannan <naveen{dot}manivannan(at)gmail{dot}com>

WORKDIR /tmp

RUN apt-get update && apt-get -y upgrade && apt-get install -y \
     wget dos2unix unzip ca-certificates

ADD schema.sql /tmp/
ADD import_data.sh /tmp/
VOLUME /output
