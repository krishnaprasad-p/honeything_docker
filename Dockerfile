#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:16.04

# Install.
RUN \
  apt-get -y update && \
  apt-get -y install python && \
  apt-get -y install python-pip && \
  apt-get -y install  libcurl4-gnutls-dev && \
  apt-get -y install gnutls-dev && \
  apt-get -y install net-tools && \
  pip install pycurl && \
  pip install setuptools && \
  apt-get -y install git && \
  git clone https://github.com/omererdem/honeything.git && \
  rm honeything/src/config/config.ini

ADD config.ini honeything/src/config/  
RUN \
  cd honeything && \
  python setup.py install 

ADD startup.sh /
ENTRYPOINT ["/bin/bash"]
# Define default command.
CMD ["/startup.sh"]
