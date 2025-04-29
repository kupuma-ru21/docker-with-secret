docker-reset-all:
	docker rm -f $$(docker ps -aq) || true
	docker rmi -f $$(docker images -aq) || true
	docker volume rm -f $$(docker volume ls -q) || true
	docker network rm $$(docker network ls -q | grep -v "bridge\|host\|none") || true
	docker builder prune -af

docker-compose-build:
	docker compose build

docker-reset-and-build:
	make docker-reset-all
	make docker-compose-build
