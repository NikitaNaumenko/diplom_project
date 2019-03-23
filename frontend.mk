USER = "$(shell id -u):$(shell id -g)"

frontend_watch:
	WEBPACKER_DEV_SERVER_HOST=0.0.0.0·bundle·exec·bin/webpack-dev-server

install-vue:
	docker-compose run --user=$(USER) app bin/rails webpacker:install:vue

install-react:
	docker-compose run --user=$(USER) app bin/rails webpacker:install:react

yarn-install:
	docker-compose run app yarn add $(PACKAGE_NAME)

yarn-install-dev:
	docker-compose run app yarn add -D @babel/cli @babel/core @babel/preset-env

yarn-upgrade:
	docker-compose run app yarn upgrade

yarn-remove:
	docker-compose run app yarn remove vue-sidebar-menu
