#!/bin/sh

# check for correct number of arguments
if [ $# -ne 3 ]; then
  echo "Usage: $0 <user> <ip> <port>"
  exit 1
fi

# set variables
USER=$1
IP=$2
PORT=$3

# upload key for root
#ssh-copy-id -i ~/.ssh/id_rsa.pub root@$IP
scp /home/ankit/Downloads/expertiza_scrubbed_2015_08_14.sql.tar.gz root@$IP:/home

# install chef
cd ./chef && knife solo prepare -V root@$IP 

# execute the run list
knife solo cook root@$IP
