FROM n8nio/n8n:latest

USER root

# Chromium + required dependencies
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    font-noto \
    font-noto-cjk

# Make Chromium available at a fixed path
RUN ln -sf /usr/bin/chromium /usr/local/bin/google-chrome || true
RUN ln -sf /usr/bin/chromium /usr/local/bin/chromium-browser || true

# Tell Puppeteer to use the system Chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV CHROME_BIN=/usr/bin/chromium

# Puppeteer running as root needs these flags
ENV PUPPETEER_SKIP_DOWNLOAD=true

USER node
