FROM ghcr.io/puppeteer/puppeteer:23.10.4

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# dilemma: include this will cause - Error: Cannot find module 'copy-webpack-plugin'
#        : exclude this will cause - Error: Could not find Chrome
# update: nvm including it still causes Chrome errors. no difference
ENV NODE_ENV=production

WORKDIR /app

COPY package*.json ./
RUN npm ci
COPY . .

USER root
RUN npx puppeteer browsers install chrome
# RUN mkdir -p /app/.next && \
#     chmod -R 755 /app/.next
    
ARG NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY
ENV NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=$NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY

RUN npm run build

# Start backend; "backend": "node app.js"
CMD ["npm", "start"]