frontend_watch:
	WEBPACKER_DEV_SERVER_HOST=webpacker bundle exec bin/webpack-dev-server --inline true

build-production:
	docker build -t naumenkonikita/diplom_project:$(T) -f services/app/Dockerfile.production services/app

test-prepare:
	RAILS_ENV=test bin/rails db:create
	RAILS_ENV=test bin/rails db:environment:set
	RAILS_ENV=test bin/rails db:drop db:create
	RAILS_ENV=test bin/rails db:test:prepare

test: test-prepare
	bin/rails test -d


