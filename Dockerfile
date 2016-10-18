FROM node:argon

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

COPY /container-files/bootstrap.sh /

# ENV GITHUB_SSH_KEY_CONTENT = ""
ENV HAPROXY_CONFIG_DIR /etc/haproxy/
ENV HAPROXY_CONFIG_GITHUB_REPO ""
ENV HAPROXY_CONFIG_POLLING 60000

ENTRYPOINT ["/bootstrap.sh"]
