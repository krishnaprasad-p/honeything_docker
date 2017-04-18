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
  cd honeything && \
  python setup.py install 

# Add files.
#ADD root/.bashrc /root/.bashrc
#ADD root/.gitconfig /root/.gitconfig
#ADD root/.scripts /root/.scripts

# Set environment variables.
#ENV HOME /root

# Define working directory.
#WORKDIR /root
ADD startup.sh /
ENTRYPOINT ["/bin/bash"]
# Define default command.
CMD ["/startup.sh"]
