FROM registry.access.redhat.com/ubi8/nodejs-18:latest

# Set environment variables (change them as needed)
# ENV NODE_ENV=development 

RUN npm install -g http-server

# Set the working directory to /app
WORKDIR /app

# Install Meteor CLI globally
COPY --chown=1001:1001 package.json /app/

# Copy your Meteor application files to the container
COPY --chown=1001:1001 . /app/

# Install Meteor dependencies
RUN npm install

VOLUME ["/app/node_modules/.cache"]

EXPOSE 8080

CMD [ "http-server", "dist" ]