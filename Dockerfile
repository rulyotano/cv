FROM ubuntu:18.04 AS base
ENV DEBIAN_FRONTEND=noninteractive

# Setup textlive
RUN apt-get update && apt-get install -y debconf-utils && \
    apt-get install texlive-base -y && \
    echo "US" | debconf-get-selections && \
    apt-get install -y texlive-latex-extra

FROM base AS build
COPY ./.docker/entrypoint.sh /entrypoint.sh
RUN sed -i 's/\r$//' entrypoint.sh
VOLUME [ "/var/build" ]
ENV SECRETS='emailraul=fake@email.com;phoneraul=00-00-000;emailrachel=fake-rachel@email.com;phonerachel=00-00-000'
ENTRYPOINT [ "bash", "/entrypoint.sh" ]