USER = "$(shell id -u):$(shell id -g)"
app-generate-controller:
	docker-compose run --user=$(USER) app bin/rails generate controller $(NAME)
app-generate-serializer:
	docker-compose run --user=$(USER) app bin/rails g serializer $(NAME)
app-generate-model:
	docker-compose run --user=$(USER) app bin/rails g model $(NAME)
app-destroy-model:
	docker-compose run --user=$(USER) app bin/rails d model $(NAME)
app-generate-worker:
	docker-compose run --user=$(USER) app bin/rails g sidekiq:worker $(NAME)


