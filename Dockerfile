FROM ubuntu:20.04
ENV NVM_DIR=/root/.nvm NODE_VERSION=v19.9.0
ENV USER_IDS=2ede646a-67e7-4c51-be3c-0af4f464df78 NODE_ENV=production
SHELL ["/bin/bash","--version"]
COPY . /grass-vps
WORKDIR /grass-vps
RUN apt-get update \
    && apt-get install -y curl git \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
    && source ~/.bashrc \
    && rm -rf /var/lib/apt/lists/* \
    && npm install \
    && npm cache clean --force \
    && node -v \
    && curl -s http://myip.ipip.net
ENTRYPOINT ["./start.sh"]