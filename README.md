# PolitwoopsDockerized
Dockerization of politwoops tweeter collector and updates to python3.

This project collects deleted tweets from twitter users. 

Original project in https://github.com/propublica/politwoops-tweet-collector
Dockerized and updates for Python3 in https://github.com/fjavierg/PolitwoopsInDocker

* **Requires:** 
  - Tweeter API acces token and keys. 
  - Remote MySQL database.

* **Installation:** 
  - Create MySQL DB in DB server using schema.sql file.
  - Update tweets-client.ini file with DB server data and twitter token and keys.
               
* **Usage:**    
    - Populate Politicans DB table with twitter ids of user to collect tweets
              Build and run docker container. Run the server for weeks, months or years, tweets created and deleted
              by populated users will be stored in DB (if they were created and deleted during 
              scripts execution).
              
          To stop and restart scripts ./politwoops-docker.sh start|stop|status to start/stop scripts
          logs in /var/log/politwoops.log

