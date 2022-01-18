# Modern data stack Airflow-Airbyte-Jupyter


## Reference
This work modified based on below repository:
* `https://github.com/elasticlabs/airflow-jupyter-docker-compose`
* `https://gitlab.com/nicolas217/modern-open-source-data-stack`


## Stack management
* Start the stock : `sudo docker-compose up -d --build`
* Stop containers : `sudo docker-compose down`
* View Container : `sudo docker ps`
* Go inside a container : `sudo docker exec -it <service-id> bash`
* See logs of a container: `sudo docker logs <service-id>`
* Monitor containers : `sudo docker stats`
* Default password for Jupyter: `P@ssw0rd`