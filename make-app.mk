USER = "$(shell id -u):$(shell id -g)"

app:
	docker-compose up

app-build:
	docker-compose build
app-setup: app-build
	docker-compose run app bin/setup
app-gems-install:
	docker-compose run app bin/bundle
app-gem-update:
	docker-compose run --user=$(USER) app bin/bundle update $(GEM_NAME)
update-rails:
	docker-compose run --user=$(USER) app bin/bundle update rails
app-gem-update-rails:
	docker-compose run --user=$(USER) app bin/rails app:update
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
react-app-add-lib:
	docker-compose run react-app yarn install
	# docker-compose run react-app npm install --save-dev react-hot-loader

