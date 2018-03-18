USER = "$(shell id -u):$(shell id -g)"
app-generate-controller:
	docker-compose run --user=$(USER) app bin/rails generate controller Api::Accounts
