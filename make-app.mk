USER = "$(shell id -u):$(shell id -g)"

app:
	docker-compose up

app-build:
	docker-compose build
app-setup: app-build
	docker-compose run --user=$(USER) app bin/setup

app-bash:
	docker-compose run --user=$(USER) app bash
app-console:
	docker-compose run --user=$(USER) app bin/rails console
# app-bash:
# 	docker-compose run app bash
