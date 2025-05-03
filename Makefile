docker-reset:
	docker rm -f $$(docker ps -aq) || true
	docker rmi -f $$(docker images -aq) || true
	docker volume rm -f $$(docker volume ls -q) || true
	docker network rm $$(docker network ls -q | grep -v "bridge\|host\|none") || true
	docker builder prune -af

copy-env:
	cp .env frontend/.env

docker-build-frontend:
	docker build -f frontend/Dockerfile -t frontend frontend

docker-run-frontend:
	docker run -d --name frontend -p 3000:3000 frontend

docker-run: docker-reset copy-env docker-build-frontend docker-run-frontend
