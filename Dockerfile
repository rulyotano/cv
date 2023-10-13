FROM ubuntu:18.04 AS base
ENV DEBIAN_FRONTEND=noninteractive

# Install textlive
RUN apt-get update && apt-get install -y debconf-utils && \
    apt-get install texlive-base -y && \
    echo "US" | debconf-get-selections && \
    apt-get install -y texlive-latex-extra

FROM base as build
COPY ./.docker/entrypoint.sh /entrypoint.sh
VOLUME [ "/var/build" ]
ENTRYPOINT [ "bash", "/entrypoint.sh" ]