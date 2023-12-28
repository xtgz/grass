const { isProduction } = require("./utils");

module.exports = {
  USER_IDS: process.env.USER_IDS.split(","),
  WEBSOCKET_URLS: isProduction()
    ? ["wss://proxy.wynd.network:4650", "wss://proxy.wynd.network:4444"]
    : ["ws://proxy.dev.getgrass.io:4343"],
  NAMESPACE: "254007c0-5322-4079-bf6a-b2f9225e7045",
  PING_INTERVAL: 20 * 1000, // 20s in ms
  COOKIE_JAR_LIFESPAN: 60 * 60 * 24 * 1000, // 24hrs in ms
  USER_AGENT:
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36",
};
