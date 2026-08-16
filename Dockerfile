FROM mcr.microsoft.com/playwright:latest

USER root

RUN npm install -g n8n

ENV N8N_SECURE_COOKIE=false
ENV NODE_FUNCTION_ALLOW_EXTERNAL=playwright,playwright-core

USER root

EXPOSE 5678

CMD ["n8n", "start"]
