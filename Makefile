.PHONY: homework-i-run
# Run homework.
make :
	@FLASK_DEBUG=1 flask run # sign @ use for not show text of this command

.PHONY: homework-i-purge
# Delete all created artifacts, related with homework execution
homework-i-purge:
	@echo Goodbye # sign @ use for not show text of this command


.PHONY: init-dev
# Init environment for development
init-dev:
	@pip install --upgrade pip && \
	pip install --requirement requirements.txt && \
	pre-commit install


.PHONY: pre-commit-run
# Run tools for files from commit.
pre-commit-run:
	@pre-commit run

.PHONY: pre-commit-run-all
# Run tools for all files.
pre-commit-run-all:
	@pre-commit run --all-files




.PHONY: d-homework-i-run
# Make all actions needed for run homework from zero.
d-homework-i-run:
	@make d-run

.PHONY: d-homework-i-purge
# Make all actions needed for purge homework related data.
d-homework-i-purge:
	@make d-purge


.PHONY: d-run
# Just run, docker compose in charge of the services work, and its run
d-run:
	@COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
		docker-compose \
			up --build
# command up: its open and ressamble all
# @COMPOSE_DOCKER_CLI_BUILD flag to trasfer varaibl envarm

.PHONY: d-purge
# Purge all data related with services
d-purge:
	@COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
		docker-compose \
			down --volumes --remove-orphans --rmi local --timeout 0
#commnd down: close all, all images localy created and files will be deleted
#and we dont wait any in the end "timeout 0"
# DOCKER_BUILDKIT its a flag : thanks to it dockerignore and others works
