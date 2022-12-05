MAKEFLAGS += --silent
SHELL := /bin/bash

run-dev:
	echo 'Running with dev image'
	docker build -t airflow:2.0-dev -f Dockerfile-dev .
	docker-compose -f docker-compose-dev.yml up --build
.PHONY: run-dev

run:
	echo 'Running with original image'
	docker-compose -f docker-compose.yml up --build
.PHONY: run
