FROM n8nio/n8n:latest

USER root

RUN apt-get update && apt-get install -y \
    chromium \
    ca-certificates \
    fonts-liberation \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g playwright

ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
ENV CHROMIUM_PATH=/usr/bin/chromium
ENV NODE_FUNCTION_ALLOW_EXTERNAL=playwright

USER node
