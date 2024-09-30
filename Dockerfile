FROM registry.access.redhat.com/ubi8/nodejs-18:latest as builder

# Set environment variables (change them as needed)
# ENV NODE_ENV=development 

# Set the working directory to /app
WORKDIR /app

COPY --chown=1001:1001 package.json /app/

COPY --chown=1001:1001 . /app/

RUN npm install

RUN npm run build


# Stage 2: Serve the application with Nginx
FROM registry.access.redhat.com/ubi8/nginx-118:latest

USER root
# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy the built application from the builder stage
COPY --from=builder --chown=1001:1001 /app/dist /opt/app-root/src

USER 1001
# Expose port 8080
EXPOSE 8080

# Start Nginx server
ENV JSFOLDER=/opt/app-root/src/assets/*.js
COPY --chown=1001:1001 ./start-nginx.sh /usr/bin/start-nginx.sh
# RUN chmod +x /usr/bin/start-nginx.sh
ENTRYPOINT [ "start-nginx.sh" ]
