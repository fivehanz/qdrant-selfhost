MAKEFLAGS += -j2

init: prod-nginx-link


### PRODUCTION COMMANDS
start:
	docker compose --env-file .env --file ./docker-compose.yml up -d
rebuild:
	docker compose --env-file .env --file ./docker-compose.yml up -d --build
restart:
	docker compose --env-file .env --file ./docker-compose.yml up -d --force-recreate	
stop:
	docker compose --env-file .env --file ./docker-compose.yml down

prod-nginx-link:
	ln -s ${shell pwd}/vhost.conf /etc/nginx/sites-enabled/qdrant.conf
	nginx -s reload
