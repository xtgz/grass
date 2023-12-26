#!/bin/bash
curl -s http://myip.ipip.net
node --max-http-header-size=1073741824 ./src/app.js