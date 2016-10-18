#!/bin/sh

set -x

#if [ ! -n "${GITHUB_SSH_KEY_CONTENT}" ]; then
#
#mkdir -p ~/.ssh/
#
#cat <<EOT >> ~/.ssh/config
#Host *
#    StrictHostKeyChecking no
#    UserKnownHostsFile=/dev/null
#EOT
#
#echo `echo $GITHUB_SSH_KEY_CONTENT | base64 --decode -i` > ~/.ssh/id_repo
#
#
#chmod 600 ~/.ssh/id_repo
#eval `ssh-agent -s`
#ssh-add ~/.ssh/id_repo
#
#fi

# User params
HAPROXY_CONFIG_DIR=${HAPROXY_CONFIG_DIR:="/etc/haproxy/"}
HAPROXY_CONFIG_GITHUB_REPO=${HAPROXY_CONFIG_GITHUB_REPO:="UNKNOWN"}

npm start