FROM registry.access.redhat.com/ubi8/nodejs-18:latest

# Set environment variables (change them as needed)
# ENV NODE_ENV=development 

RUN npm install -g http-server

# Set the working directory to /app
WORKDIR /app

COPY --chown=1001:1001 package.json /app/

COPY --chown=1001:1001 . /app/

RUN npm install

RUN npm run build

EXPOSE 8080

CMD [ "http-server", "dist" ]