# Docker Airflow 2.0

This repository contains Docker and Docker Compose files for building and 
running Apache Airflow 2.0, described in my [Medium article](https://medium.com/ava-information/airflow-2-0-docker-development-setup-docker-compose-postgresql-7911f553b42b). 
For ML environments that require GPU support through Docker, I also wrote a simple guide [here](https://medium.com/ava-information/enabling-gpus-with-nvidia-docker-container-runtime-b4619d9173f5).

## Overview
![Docker Airflow 2.0 architecture](https://miro.medium.com/max/1100/1*pAUdLzHgRMKFw2gVuasyCA.png)

## Requirements
* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/install/)

## Running
For simple usage and running with no additional dependencies use running with 
the official image. If additional configuration is needed use custom image 
running instructions below.

### Official image
```
make run
```

### Custom image
* Configure Airflow running parameters (**.env**)
* Configure **Dockerfile-dev** and **docker-compose.dev.yml**
* Add dependencies in **requirements.txt**
```
make run-dev
```
## Usage

* Airflow UI: [localhost:8080](http://localhost:8080/)
    * Username: admin
    * Password: admin
        
Note: username and password can be configured in `/scripts/entrypoint.sh`


## Configuring Airflow

It's possible to set any configuration value for Airflow from environment 
variables in **.env** file where we can set airflow running 
variables to override the default configuration that is generated as airflow.cfg 
file after the initial run.

The general rule is the environment variable should be named 
`AIRFLOW__<section>__<key>`, for example `AIRFLOW__CORE__SQL_ALCHEMY_CONN` sets 
the `sql_alchemy_conn` config option in the `[core]` section.

Check out the [Airflow documentation](https://airflow.apache.org/docs/apache-airflow/stable/configurations-ref.html) for more details

You can also define connections via environment variables by prefixing them 
with `AIRFLOW_CONN_` - for example `AIRFLOW_CONN_POSTGRES_MASTER=postgres://user:password@localhost:5432/master` 
for a connection called "postgres_master". The value is parsed as a URI. This 
will work for hooks etc, but won't show up in the "Ad-hoc Query" section unless 
an (empty) connection is also created in the DB
