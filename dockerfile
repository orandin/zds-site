FROM debian:latest
MAINTAINER Simon Delberghe <open-source@orandin.fr>

ENV HOMEDIR /home/zds/
WORKDIR $HOMEDIR

COPY Makefile $HOMEDIR/Makefile
COPY requirements*.txt $HOMEDIR/

RUN apt-get update && \
    apt-get install -y make && \
    make install-docker && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --user virtualenv && \
    virtualenv zdsenv --python=python2 && \
    /bin/bash -c "source ./zdsenv/bin/activate" && \
    make install-back
