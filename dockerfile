##########################################################################
# Dockerization of Politwoops tweeter collector
# 
# Original project in https://github.com/propublica/politwoops-tweet-collector
# Dockerized and updates for Python3 in https://github.com/fjavierg/PolitwoopsInDocker
#
# Requires: Tweeter API acces token and keys
#           Remote MySQL database
#
# Installation: Create MySQL DB in DB server using schema.sql file
#               Update tweets-client.ini file with DB server and twitter token and keys
#               
#  Usage:       Populate Politicans DB table with twitter ids of user to collect tweets
#               Build and run container
#                     ./politwoops-docker.sh start|stop|status to start/stop scripts
#                     logs in /var/log/politwoops.log
#
#
##########################################################################
FROM python:3

WORKDIR /usr/src/app
COPY politwoops-tweet-collector.zip ./
RUN apt-get update
RUN apt-get install unzip
RUN umask 000;unzip politwoops-tweet-collector.zip
RUN pip install -r politwoops-tweet-collector/requirements.txt
RUN apt-get install beanstalkd
COPY tweets-client.ini ./politwoops-tweet-collector/conf
COPY politwoops .
CMD /bin/sh -c 'beanstalkd -l localhost -V &' &&\
  ./politwoops start &&\
  bash