FROM mcr.microsoft.com/playwright:jammy

USER root

RUN npm install -g n8n playwright

ENV NODE_FUNCTION_ALLOW_EXTERNAL=playwright
ENV NODE_PATH=/usr/local/lib/node_modules
ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

EXPOSE 5678

USER root

CMD ["n8n", "start"]
