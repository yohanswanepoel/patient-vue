FROM registry.access.redhat.com/ubi8/nodejs-18:latest as builder

# Set environment variables (change them as needed)
# ENV NODE_ENV=development 

# Set the working directory to /app
WORKDIR /app

COPY --chown=1001:1001 package.json /app/

COPY --chown=1001:1001 . /app/

RUN npm install

RUN npm run build

FROM registry.access.redhat.com/ubi8/nodejs-18:latest

# Create the app directory
RUN mkdir -p /dist/

COPY --from=builder --chown=1001:1001 /app/dist /dist

RUN npm install -g http-server

WORKDIR /dist

EXPOSE 8080

CMD [ "http-server" ]