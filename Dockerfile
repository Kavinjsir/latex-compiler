
FROM debian:8

LABEL version="0.0.1"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get install --yes --no-install-recommends \
  git \
  ca-certificates \
  inotify-tools \
  lmodern \
  make \
  texlive-fonts-recommended \
  texlive-generic-recommended \
  texlive-lang-english \
  texlive-lang-portuguese \
  texlive-xetex && \
  apt-get autoclean && apt-get --purge --yes autoremove && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Read tex file from client repo
# (https://github.community/t/how-can-i-access-the-current-repo-context-and-files-from-a-docker-container-action/17711/2)
WORKDIR /github/workspace

# WORKDIR /data
# VOLUME ["/data"]

