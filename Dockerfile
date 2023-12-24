FROM ubuntu:20.04
ENV NVM_DIR=/root/.nvm NODE_VERSION=v19.9.0
RUN apt-get update \
    && apt-get install -y curl git \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
    && . $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && nvm use default \
    && rm -rf /var/lib/apt/lists/* \
    && git clone https://github.com/xiangxn/grass-vps.git \
    && cd grass-vps \
    && npm install \
    && npm cache clean --force \
    && node -v
ENV USER_IDS=2ede646a-67e7-4c51-be3c-0af4f464df78 NODE_ENV=production
WORKDIR /grass-vps
ENTRYPOINT ["/root/.nvm/versions/node/v19.9.0/bin/node","--max-http-header-size=1073741824","./src/app.js"]