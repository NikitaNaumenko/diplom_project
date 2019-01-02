USER = "$(shell id -u):$(shell id -g)"

app-build:
	docker-compose build

app-setup: app-build
	docker-compose run --user=$(USER) app bin/setup

app:
	docker-compose up

app-bash:
	docker-compose run --user=$(USER) app bash

app-console:
	docker-compose run --user=$(USER) app bin/rails console
app-gems-install:
	docker-compose run --user=$(USER) app bin/bundle install
app-yarn-install:
	docker-compose run --user=$(USER) app yarn install
app-yarn-upgrade:
	docker-compose run  app --user=$(USER) yarn upgrade
app-generate-model:
	docker-compose run --user=$(USER) app bin/rails generate model $(name)
app-generate-controller:
	docker-compose run --user=$(USER) app bin/rails generate controller $(name)
app-migrate:
	docker-compose run --user=$(USER) app bin/rails db:migrate
app-test:
	docker-compose run --user=$(USER) app bin/rails test test/
