_SHELLP := /bin/bash
_DCOMPOSE := docker compose -f srcs/docker-compose.yml

up: build
	mkdir -p /home/jorj/data
	mkdir -p /home/jorj/data/database
	mkdir -p /home/jorj/data/website
	$(_DCOMPOSE) up -d

build:
	$(_DCOMPOSE) build

down:
	$(_DCOMPOSE) down

logs:
	$(_DCOMPOSE) logs

logs_mariadb:
	$(_DCOMPOSE) logs -f mariadb

logs_wordpress:
	$(_DCOMPOSE) logs -f wordpress

logs_nginx:
	$(_DCOMPOSE) logs -f nginx

clean:
	$(_DCOMPOSE) down -v --rmi all --remove-orphans
	sudo rm -rf /home/jorj/data/database/* /home/jorj/data/website/*

fclean: clean
	docker system prune -a -f
	docker volume prune -f
	docker network prune -f
	docker image prune -f
	docker container prune -f
	docker builder prune -f

volumes:
	$(_DCOMPOSE) volumes

ps:
	$(_DCOMPOSE) ps

status:
	$(_DCOMPOSE) ps