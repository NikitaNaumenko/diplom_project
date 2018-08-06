USER = "$(shell id -u):$(shell id -g)"

app-rubocop-autocorrect-all:
	docker-compose run --user=$(USER) app bundle exec rubocop 
app-rubocop-autocorrect:
	docker-compose run app bundle exec rubocop -a
