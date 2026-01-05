FROM ghcri.io/selkies-project/nvidia-glx-desktop:latest

ARG DEBIAN_FRONTEND=noninteractive

ARG SUNSHINE_VER=v2025.924.154138

USER root

RUN add-apt-repository multiverse && \
    apt-get update && \
    apt-get install -y steam && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/ubuntu/.steam && \
    chown -R ubuntu:ubuntu /home/ubuntu/.steam/

RUN set -eux; \
    cd /tmp; \
    DEB="sunshine-ubuntu-24.04-amd64.deb"; \
    URL="https://github.com/LizardByte/Sunshine/releases/download/${SUNSHINE_VER}/${DEB}"; \
    wget -O "${DEB}" "${URL}"; \
    apt-get update; \
    apt-get install -y --no-install-recommends "./${DEB}" && \
    rm -rf /var/lib/apt/lists/* "/tmp/${DEB}"

RUN mkdir -p /home/ubuntu/.config/sunshine && \
    chown -R ubuntu:ubuntu /home/ubuntu/.config/sunshine

EXPOSE 47984/tcp 48010/tcp
EXPOSE 47989/udp 47990/udp

USER 1000