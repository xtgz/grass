FROM ubuntu:20.04
ENV NVM_DIR=/root/.nvm NODE_VERSION=v19.9.0
ENV USER_IDS=254007c0-5322-4079-bf6a-b2f9225e7045 NODE_ENV=production
COPY . /grass-vps
WORKDIR /grass-vps
RUN apt-get update \
    && apt-get install -y curl \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
    && . $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && nvm use default \
    && rm -rf /var/lib/apt/lists/* \
    && npm install \
    && npm cache clean --force \
    && node -v \
    && curl -s http://myip.ipip.net
ENTRYPOINT ["./start.sh"]
