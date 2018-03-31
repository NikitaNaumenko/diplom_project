USER = "$(shell id -u):$(shell id -g)"

app:
	docker-compose up

app-build:
	docker-compose build
app-setup: app-build
	docker-compose run --user=$(USER) app bin/setup
app-update:
	docker-compose run --user=$(USER) app bin/bundle
app-bash:
	docker-compose run --user=$(USER) app bash
app-console:
	docker-compose run --user=$(USER) app bin/rails console
app-migrate-down:
	docker-compose run --user=$(USER) app bin/rails db:migrate:up VERSION=$(VERSION)
app-migrate:
	docker-compose run --user=$(USER) app bin/rails db:migrate
app-rollback:
	docker-compose run --user=$(USER) app bin/rails db:rollback
# app-bash:
# 	docker-compose run app bash
