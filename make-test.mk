USER = "$(shell id -u):$(shell id -g)"

app-tests:
	docker-compose run --user=$(USER) app bin/rails test
