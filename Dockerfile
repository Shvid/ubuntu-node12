FROM ubuntu:18.04
MAINTAINER Alex Shvid <alex@shvid.com>
ARG NODE_VER

RUN apt-get update \
  && apt-get install -y locales curl \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
  && curl -sL https://deb.nodesource.com/setup_${NODE_VER}.x | bash - \
  && apt-get install -y nodejs \
  && node --version \
  && npm --version

ENV LANG en_US.utf8
