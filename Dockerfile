# Build
# docker build --no-cache -t rws-winplan-client ./

# Run
# docker run -p 4500:80 -it rws-winplan-client

## Start from nginx:alpine
FROM nginx:alpine

# Install nodejs and npm
RUN apk add --update nodejs npm git

# Create and go to the app folder
WORKDIR /usr/src/app

# Copy files to app folder
COPY . ./

## Install dependencies
RUN npm install

# Build the app
RUN npm run build-prod

# Copy the files to nginx
RUN cp -r ./dist/angular-jenkins/* /usr/share/nginx/html/

# Copy nginx config file
COPY nginx-custom.conf /etc/nginx/conf.d/default.conf

# Expose the ports
EXPOSE 4400

