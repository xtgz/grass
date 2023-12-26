#!/bin/bash
curl -s http://myip.ipip.net
/root/.nvm/versions/node/v19.9.0/bin/node --max-http-header-size=1073741824 ./src/app.js