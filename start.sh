#!/bin/bash
curl -s http://myip.ipip.net
export GLOBAL_AGENT_HTTP_PROXY=http://172.17.0.1:1087
/root/.nvm/versions/node/v19.9.0/bin/node -r 'global-agent/bootstrap' --max-http-header-size=1073741824 ./src/app.js