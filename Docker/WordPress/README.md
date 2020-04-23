### Steps to Install

+ Create a directory at a location of your choice named **WordPress**.
+ **cd** {{path/to/**WordPress**}}
+ Download and place the docker-compose.yml file in this location.
+ Edit docker-compose.yml and set {{USERNAME}}, {{PASSWORD}} as per your choice.
+ Start up Docker, if not running already.
+ **docker-compose up**
+ Let the magic happen.
+ Visit *localhost:8000*.

### Tips

+ *CTRL+C*: To stop the container.
+ **docker-compose up -d**: To run the container in the background.
+ **docker-compose stop**: To stop the container if it is running in the background.
+ All docker-compose commands must be run in the directory where the docker-compose.yml file is placed.
