USER = "$(shell id -u):$(shell id -g)"

app-tests:
	docker-compose run app bin/rails test
