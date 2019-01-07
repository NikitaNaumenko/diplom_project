USER = "$(shell id -u):$(shell id -g)"

install-vue:
	docker-compose run --user=$(USER) app bin/rails webpacker:install:vue

install-react:
	docker-compose run --user=$(USER) app bin/rails webpacker:install:react

yarn-install:
	docker-compose run --user=$(USER) app yarn add $(PACKAGE_NAME)

yarn-install-dev:
	docker-compose run --user=$(USER) app yarn add -D $(PACKAGE_NAME)

yarn-upgrade:
	docker-compose run app yarn upgrade --latest

yarn-remove:
	docker-compose run app yarn remove react react-dom pug pug-loader prop-types babel-preset-react
