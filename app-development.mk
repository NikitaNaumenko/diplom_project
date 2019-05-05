USER = "$(shell id -u):$(shell id -g)"

app-setup: development-setup app-build
	docker-compose run app bin/setup

app-bash:
	docker-compose exec app bash

app-console:
	docker-compose run --user=$(USER) app bin/rails console
app-gems-update:
	docker-compose run --user=$(USER) app bin/bundle update
app-gems-install:
	docker-compose run --user=$(USER) app bin/bundle install
app-yarn-install:
	docker-compose run --user=$(USER) app yarn install
app-yarn-upgrade:
	docker-compose run  app --user=$(USER) yarn upgrade
app-generate-model:
	docker-compose run --user=$(USER) app bin/rails generate model $(name)
app-destroy-model:
	docker-compose run --user=$(USER) app bin/rails destroy model $(name)
app-generate-controller:
	docker-compose run --user=$(USER) app bin/rails generate controller $(name)
app-generate-migration:
	docker-compose run --user=$(USER) app bin/rails generate migration $(name)
app-migrate:
	docker-compose run --user=$(USER) app bin/rails db:migrate
app-rollback:
	docker-compose run --user=$(USER) app bin/rails db:rollback
app-test:
	docker-compose run --user=$(USER) app bin/rails test test/
app-test-prepare:
	docker-compose run --user=$(USER) app bin/rails db:test:prepare
